class CategoryController < ApplicationController
  def get_all
    render :json => Category.all
  end

  def get_categories
    render :json => if params.include? :id then
                      Category.where(:ancestry => params[:id]).order('sort_index')
                    else
                      Category.where(:ancestry => nil).order('sort_index')
                    end      
  end
end
