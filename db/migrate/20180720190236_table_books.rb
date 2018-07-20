class TableBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books
    add_column :books, :title, :string
  end
end
