class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :description
      t.string :option_1
      t.string :option_2
      t.string :option_3
      t.string :option_4
      t.integer :right_option

      t.timestamps
    end
  end
end
