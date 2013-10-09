class Level < ActiveRecord::Base
  has_many :books
  has_many :articles
  has_many :videos
end
