class HomeController < ApplicationController
  def index
  end
  def online_assistance
  	
  end
  def feedback
  	@feedback= Feedback.new
  end
  def feedback_create
    
    @feedback = Feedback.new(feedback_params)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to home_feedback_path, notice: 'Your review has been submitted succesfully.' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :feedback }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end
  def lab_hours
  	
  end
  def requests
  	
  end



  private
  def feedback_params
    params.require(:feedback).permit(:content, :stars)
  end
end
