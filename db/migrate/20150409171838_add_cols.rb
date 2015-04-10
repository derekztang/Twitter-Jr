class AddCols < ActiveRecord::Migration
  def change
    add_column :users, :user_bio, :string
    add_column :users, :user_bio_picture, :string
  end
end
