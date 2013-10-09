class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :head_video
      t.belongs_to :category
      t.belongs_to :level
      t.belongs_to :language

      t.timestamps
    end
  end
end
