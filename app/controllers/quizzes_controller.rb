class QuizzesController < ApplicationController
    before_action :authenticate_user!
    # , :assign_to_user

    def assign_to_user
        # Do this only Once!
        
    end

    # @questions = current_user.questions


    def home
    end

    def index
        if current_user.answered_responses == 0
            current_user.start_time = Time.now.utc
            questions = Question.order("RAND()").limit(10)
            current_user.questions = []
            current_user.questions << questions
            current_user.save

            redirect_to new_response_url
        end
    end
end 

