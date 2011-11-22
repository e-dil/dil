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
      params[:q] = m[2] unless m.nil?
      word = Word.find_by_name(params[:q])
      redirect_to word unless word.nil?
    
      @words = Word.where('name LIKE ?', "%#{params[:q]}%")
    end
  end
end
