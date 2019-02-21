class CreateTeamDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :team_details do |t|
      t.belongs_to :user, index: true, foreign_key: true

      t.string :team_name

      t.string :name_1
      t.string :roll_1
      t.string :contact_1

      t.string :name_2
      t.string :roll_2
      t.string :contact_2

      t.string :name_3
      t.string :roll_3
      t.string :contact_3

      t.string :name_4
      t.string :roll_4
      t.string :contact_4

      t.timestamps
    end
  end
end
