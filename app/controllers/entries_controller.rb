class EntriesController < InheritedResources::Base
  def index
    @head = Head.find(params[:head_id])
    @entries = @head.entries
    col       = params[:col].to_i
    @col      = Entry.get_column(@head.id, col)
    @next_col = Entry.get_column(@head.id, col + 1)
    @total_cols = @entries.last.text
  end

  def search
    @exact_terms = Term.where('name LIKE ?', "#{params[:q]}")
    @terms = Term.where('name LIKE ?', "%#{params[:q]}%")
  end
  
  def advanced_search
    @terms = Term.where('name LIKE ?', "%#{params[:q]}%")
  end
end
