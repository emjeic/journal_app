class AddUserIdToCategoryModel < ActiveRecord::Migration[7.1]
  def change
    add_reference :categories, :user, foreign_key: true
    add_reference :tasks, :user, foreign_key: true
  end
end
