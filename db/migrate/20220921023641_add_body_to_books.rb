class AddBodyToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :body, :text
  end
end
