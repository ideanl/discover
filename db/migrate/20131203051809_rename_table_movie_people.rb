class RenameTableMoviePeople < ActiveRecord::Migration
  def change
    rename_table :movie_people, :hobby_people
    rename_column :hobby_people, :movie_id, :hobby_id
    add_column :hobby_people, :hobby, :string
  end
end
