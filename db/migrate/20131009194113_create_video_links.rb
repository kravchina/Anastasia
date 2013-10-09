class CreateVideoLinks < ActiveRecord::Migration
  def change
    create_table :video_links do |t|
      t.string :url
      t.belongs_to :video

      t.timestamps
    end
  end
end
