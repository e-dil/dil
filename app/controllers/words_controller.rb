class WordsController < ApplicationController
  def show
    @word = Word.find(params[:id])
  end

  def search
    if params[:language] == 'English' then
      defs = Definition.where('text LIKE ?', "%<def>#{params[:q]}</def>%")
      @words = defs.map(&:entry).map(&:terms).flatten.map(&:word).uniq
    else
      m = params[:q].match(/^(\d+) (.+)/)
      unless m.nil?
        params[:q] = m[2]
      end
      word = Word.find_by_name(params[:q])
      redirect_to word unless word.nil?
    
      @words = Word.where('name LIKE ?', "%#{params[:q]}%")
    end
  end
end
