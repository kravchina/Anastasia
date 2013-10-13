class LevelController < ApplicationController
  def get_all
    render :json => Level.all
  end
end
