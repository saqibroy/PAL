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
  def reports
  	
  end
  def reports_data
  	@rp= params[:report]
  	@date= Date.new @rp["date(1i)"].to_i, @rp["date(2i)"].to_i, @rp["date(3i)"].to_i
  	@a= Question.all.where("course like ? AND date(created_at) = ?", 'COSC 1435',@date ).count
  	@b= Question.all.where("course like ? AND date(created_at) = ?", 'COSC 1436',@date ).count
  	@c= Question.all.where("course like ? AND date(created_at) = ?", 'COSC 2334',@date ).count
  	@d= Question.all.where("course like ? AND date(created_at) = ?", 'COSC 2437',@date ).count
  	@e= Question.all.where("course like ? AND date(created_at) = ?", 'Other',@date ).count
  end



  private
  def answer_params
      params.require(:answer).permit(:content)
    end
    def report_params
      params.require(:report).permit(:date)
    end
end
