class CreateQuestionsUsersJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :questions, :users do |t|
      # t.index [:question_id, :user_id]
      # t.index [:user_id, :question_id]
      
    end

    add_index :questions_users, [ :question_id, :user_id ], unique: true  
  end

end
