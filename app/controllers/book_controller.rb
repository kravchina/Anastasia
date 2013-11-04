class BookController < ApplicationController
  def get_books
    render :json => ResourceHelper.get_resources(Book, params)
  end

  def random_books
    count = params[:count] | 5
    
    render :json => Book.limit(5).order("random()")
  end
end
