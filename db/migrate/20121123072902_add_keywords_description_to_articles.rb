class AddKeywordsDescriptionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :description, :string

    add_column :articles, :keywords, :string

    add_column :articles, :published, :boolean, :default => false

  end
end
