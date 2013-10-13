class VideoController < ApplicationController
  def get_videos
    options = [:category_id, :level_id, :language_id]
    query = params.select { |key, value| options.include? key.to_sym }

    render :json => query.length ? Video.where(query) : Video.all
  end
end
