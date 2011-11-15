namespace :admin do
  desc "Import XML"
  task(:import => :environment) do
    # Stage 1: 
    # Build Entries, Term, Definitions, Keywords and Translations
    
    puts 'Deleting existing entries.'
    $redis.flushall
    [Definition, Letter, Entry, Term, Word].map(&:delete_all)

    puts 'Mining XML Documents'
    Dir['xml/*.xml'].sort.each do |filename|
      puts "Opening: #{filename}."
      doc = Nokogiri(File.open(filename,'r'))

      # All entries belong to a Letter.  There should be only one Letter per
      # XML file, but one Letter may be split across multiple files, e.g. 'D'.
      head = doc.css('orth').first.text.chr.upcase
      letter = Letter.find_or_create_by_name(head)

      # Each letter file contains lots of entries. 
      doc.css('entry').each do |entry|
        e = Entry.create(:letter => letter)

        # Each entry has one or more orths
        # A word can have many terms, a word is like an orth
        # a term is like the root of an orth
        entry.css('orth').each do |w|
          term_text = entry.css('orth').text
          t = Term.find_or_create_by_name(term_text)
          m = term_text.match(/^(\d+) (.+)$/) 
          if m.nil? then
            t.word = Word.find_or_create_by_name(t.name)
          else
            t.word = Word.find_or_create_by_name(m[2])
            t.position = m[1]
          end
          t.save
          e.terms << t
        end

        # tags that make up the entry definition
        entry.css('sense, eg, egform').each do |d|       
          e.definitions << Definition.create(:text => d.inner_html, :kind => d.name)
        end
      end
    end
  end
end
