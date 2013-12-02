class AddColumnToMovie < ActiveRecord::Migration
  def change
    rename_table :movies, :hobbies
    add_column :hobbies, :hobby, :string
  end
end
