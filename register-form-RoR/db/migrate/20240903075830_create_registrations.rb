class CreateRegistrations < ActiveRecord::Migration[7.1]
  def change
    create_table :registrations do |t|
      t.string :firstName
      t.string :lastName
      t.date :birthday
      t.string :gender
      t.string :email
      t.string :phone
      t.string :subject

      t.timestamps
    end
  end
end
