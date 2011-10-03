class Definition < ActiveRecord::Base
  belongs_to :entry
  belongs_to :part_of_speech
  has_many :bibls
  has_many :translations

  def format_text
    t = text
    t = t.gsub(/<eg>(.+?)<\/eg>/m, '<span class="eg">\1</span>')
    t = t.gsub(/<form>(.+?)<\/form>/m, '<span class="form">\1</span>')
    t = t.gsub(/<q>(.+?)<\/q>/m, '<span class="q">\1</span>')
    t = t.gsub(/<br\ column=\"(\d+?)\"\ line=\"(\d+?)\">/m, '<span class="br" data-column="\1" data-line="\2"></span>')
    # first and last - use scan
    # Translation - for each 
    t.scan(/<def>(.+?)<\/def>/m) do |x|
      translations.create :name => x
    end
    t.scan(/<tr>(.+?)<\/tr>/m) do |x|
      translations.create :name => x
    end
    # Replace 
    # Bibl
    a = []
    text.scan(/<bibl><title target="(.+?)" xml:id="(.+?)">(.+?)<\/title>\n<biblscope>(.+?)<\/biblscope><\/bibl>/m) do |w, x, y, z|
      puts x
      a << bibls.create(:code => x, :title => y, :scope => z)
    end
    m = text.match(/<pos>(.+?)<\/pos>/)
    unless m.nil?
      update_attribute(:part_of_speech, PartOfSpeech.find_or_create_by_name(m[1]))
    end
# ref
    update_attribute(:text, t)
  end
end
