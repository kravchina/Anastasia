class Video < ActiveRecord::Base
  belongs_to :category
  belongs_to :language
  belongs_to :level
  has_many :video_links
end
