class Response < ApplicationRecord
    belongs_to :user

    def on_create_response(id,right_option)
        self.time_taken = (11 - self.time_taken.to_i).to_s
        self.user_id = id
        self.correct_response = right_option
        self.save
    end
end
