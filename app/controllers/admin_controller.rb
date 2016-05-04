class AdminController < ApplicationController
	layout 'admin'
  
  def index
  	@fc= Feedback.all.count
  	@qc= Question.all.count
  end
  def questions
  	@questions= Question.all.where('id NOT IN (SELECT question_id from answers)')
  end
  def answer_new
  	@question= Question.find(params[:id])
  	@answer= @question.answers.build
  end
  def answer_create
  	@question= Question.find(params[:id])
  	@answer = @question.answers.build(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to admin_questions_path, notice: 'Your answer has been submitted succesfully.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :answer_new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end
  def feedbacks
  	@feedbacks= Feedback.all
  end



  private
  def answer_params
      params.require(:answer).permit(:content)
    end
end
