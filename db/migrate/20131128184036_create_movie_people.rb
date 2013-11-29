class CreateMoviePeople < ActiveRecord::Migration
  def change
    create_table :movie_people do |t|
      t.integer :student_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
