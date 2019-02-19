class QuizzesController < ApplicationController
    before_action :authenticate_user!

    # @questions = current_user.questions


    def home
    end

    def index
        if current_user.answered_responses == 0
            respond_to do |format|
                current_user.start_time = Time.now.utc
                questions = Question.order("RAND()").limit(10)
                current_user.questions = []
                current_user.questions << questions
                current_user.save

                # redirect_to new_response_url
                format.html { redirect_to new_response_path, notice: 'Your time starts now!'}
            end
        end
    end
end 

