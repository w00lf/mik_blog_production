class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :autor
      t.string :date_post

      t.timestamps
    end
  end
end