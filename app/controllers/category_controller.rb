class CategoryController < ApplicationController
  def get_all
    render :json => Category.all
  end
end
