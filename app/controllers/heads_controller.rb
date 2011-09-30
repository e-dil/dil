class HeadsController < InheritedResources::Base
  def index
    @heads = Head.order(:letter)
  end

  def show
    @head = Head.find params[:id]
    redirect_to head_entries_url(@head)
  end
end
