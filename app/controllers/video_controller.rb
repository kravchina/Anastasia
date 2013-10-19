class VideoController < ApplicationController
  def get_videos
    render :json => ResourceHelper.get_resources(Video, params)
  end
end
