class QuizzesController < ApplicationController
    # before_action :authenticate_user!

    # @questions = current_user.questions


    def home
    end

    def index
        if !current_user.started_quiz && current_user.time_interval?
            respond_to do |format|
                current_user.start_quiz
                format.html { redirect_to new_response_path, notice: 'Your time starts now!' }
            end
        end
    end
end 

