class Category < ActiveRecord::Base
  has_ancestry
  has_many :articles
  has_many :books
  has_many :videos
end
