%w[rubygems nokogiri].each{|x| require x}

namespace :admin do
  desc "Import XML"
  task(:import => :environment) do
    # Stage 1: Build Entries, Term, Definitions, Keywords and Translations
    [Entry].map(&:delete_all)
    Dir['xml/*.xml'].sort.each do |filename|
      filename = 'xml/G.xml'
      doc = Nokogiri(File.open(filename,'r'))
      doc.css('entry').each do |entry|
        e = Entry.new
        e.orth = Orth.find_by_name(entry.css('orth').text)
        entry.css('egform').each {|eg| e.eg_forms << EgForm.create(:text => eg.inner_html)}
        #entry.css('eg').each {|eg| e.eg_forms << EgForm.create(:text => eg.inner_html)}
        entry.css('oVar').each {|o| e.overs << Over.create(:name => o.text)} 
        # ref
        e.save
      end
    end
  end

  desc "Import Orth Tags"
  task(:orth => :environment) do
    Orth.delete_all
    Dir['xml/*.xml'].sort.each do |filename|
      File.open(filename, 'r').each do |line|
        begin
          m = line.match(/orth xml:id="([\d\w\s\(\)]+)"/)
          p = line.match(/(\d+)/)
          Orth.create(:name => m[1], :column => p[1], :line => p[2], :head => filename[4])
        rescue
        end
      end
    end
  end

  desc "Import Orth Tags"
  task(:termify => :environment) do
    Term.delete_all
    Orth.all.each do |o|
      m = o.name.match(/^(\d+) (.+)/)
      next if m.nil?
      t = Term.find_or_create_by_name(m[2])
      o.position = m[1].to_i
      o.term = t
      o.save
    end
  end
end