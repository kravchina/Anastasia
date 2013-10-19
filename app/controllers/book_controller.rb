class BookController < ApplicationController
  def get_books
    render :json => ResourceHelper.get_resources(Book, params)
  end
end
