class LettersController < ApplicationController
  def index
    @letters = Letter.all
  end

  def show
    @letter = Letter.find(params[:id])
    @words = @letter.words.group('words.id').page(params[:page]).per(200)
  end
end
