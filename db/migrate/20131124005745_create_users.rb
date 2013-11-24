class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :fname
      t.string :lname

      t.timestamps
    end
  end
end