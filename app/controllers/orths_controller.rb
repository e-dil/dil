class OrthsController < ApplicationController
  def index
    @orths = Orth.find_all_by_head 'B'
  end

  def search
    @results = Term.where('name LIKE ?', "%#{params[:q]}%").paginate(:page => params[:page], :per_page => 20)
  end
end
