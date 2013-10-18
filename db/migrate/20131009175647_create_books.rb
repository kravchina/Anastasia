class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :cover
      t.string :author
      t.text :description
      t.string :isbn
      t.belongs_to :category
      t.belongs_to :level
      t.belongs_to :language
      t.belongs_to :user

      t.timestamps
    end
  end
end
