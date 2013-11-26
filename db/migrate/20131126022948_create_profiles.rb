class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :birthday
      t.string :photo
      t.string :job
      t.string :school
      t.string :birthplace
      t.string :location
      t.string :movies
      t.string :books
      t.string :shows
      t.string :people
      t.string :sports
      t.string :teams

      t.timestamps
    end
  end
end
