class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.integer :user_id
      t.integer :correct_response
      t.integer :given_response
      t.timestamps
    end
  end
end
