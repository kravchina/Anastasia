class ArticleController < ApplicationController
  def get_articles
    render :json => ResourceHelper.get_resources(Article, params)
  end
end
