class LanguageController < ApplicationController
  def get_all
    render :json => Language.all
  end
end
