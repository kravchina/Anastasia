class ArticleController < ApplicationController
  def get_articles
    options = [:category_id, :level_id, :language_id]
    query = params.select { |key, value| options.include? key.to_sym }

    render :json => query.length ? Article.where(query) : Article.all
  end
end
