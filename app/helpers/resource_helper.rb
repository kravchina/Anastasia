module ResourceHelper
  PAGE_SIZE = 5

  def ResourceHelper.get_resources(model, params)
    options = [:category_id, :level_id, :language_id]
    query = params.select { |key, value| options.include? key.to_sym }

    result = query.length ? model.where(query) : model.all
    result = result.paginate(:page => params[:page], :per_page => PAGE_SIZE) if params.include? :page

    result
  end
end