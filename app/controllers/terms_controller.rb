class TermsController < InheritedResources::Base
  def index
    @terms = Term.paginate :page => params[:page], :per_page => params[:per_page]
  end

  def show
    @term = Term.find params[:id]
    @terms = Term.paginate :page => params[:page], :per_page => params[:per_page]
  end

end
