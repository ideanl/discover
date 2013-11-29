class RenameColumnFromMoviePersonTable < ActiveRecord::Migration
  def change
    rename_column :movie_people, :student_id, :user_id
  end
end
