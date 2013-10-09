class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :link
      t.text :description
      t.belongs_to :category
      t.belongs_to :level
      t.belongs_to :language

      t.timestamps
    end
  end
end
