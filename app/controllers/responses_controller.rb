class ResponsesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_response, only: []

  # GET /responses
  # GET /responses.json
  # def index
  #   @responses = Response.all
  # end

  # # GET /responses/1
  # # GET /responses/1.json
  # def show
  # end

  # GET /responses/new
  def new
    @response = Response.new
  end

  # # GET /responses/1/edit
  # def edit
  # end

  # POST /responses
  # POST /responses.json
  def create
    
    @response = Response.new(response_params)
    @question = current_user.questions.first
    @response.user_id = current_user.id
    @response.correct_response = @question.right_option

    current_user.answered_responses += 1
    current_user.right_responses += 1 if @response.given_response == @question.right_option

    respond_to do |format|

      if current_user.answered_responses == 10
        
        current_user.questions.delete(@question) if @question

        current_user.end_time = Time.now.utc
        current_user.total_time_taken_s = (current_user.end_time.to_i) - (current_user.start_time.to_i)
        current_user.save

        @response.save

        format.html { redirect_to quizzes_url }

      elsif @response.save && current_user.save
        current_user.questions.delete(@question) if @question

        format.html { redirect_to new_response_path, notice: 'Answer recorded! '}
        format.json { render :show, status: :created, location: @response }
      else
        format.html { render :new }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /responses/1
  # # PATCH/PUT /responses/1.json
  # def update
  #   respond_to do |format|
  #     if @response.update(response_params)
  #       format.html { redirect_to @response, notice: 'Response was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @response }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @response.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /responses/1
  # # DELETE /responses/1.json
  # def destroy
  #   @response.destroy
  #   respond_to do |format|
  #     format.html { redirect_to responses_url, notice: 'Response was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:correct_response, :given_response)
    end
end
