class PollsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: [:move]
  skip_after_action :verify_authorized
  before_action :verify_admin, only: [ :new, :edit ]
  before_action :check_status, only: [ :show ]

  def new
    @poll = Poll.new
  end

  def show
    @poll = Poll.find_by_id(params[:id])
    @questions = @poll.questions.includes(:vote_options)
    @steps = @questions.collect(&:comment).compact + @questions
  end

  def edit
    @poll = Poll.find_by_id(params[:id])
    @questions = @poll.questions.includes(:vote_options)
  end

  def destroy
    @poll = Poll.find_by_id(params[:id])
    if @poll.destroy
      flash[:success] = 'Poll was destroyed!'
    else
      flash[:warning] = 'Error destroying poll...'
    end
    redirect_to surveys_path
  end

  def move 
    @question.insert_at(params[:position].to_i)
    head :ok
  end

  private

  def verify_admin
    unless current_user.admin?
      redirect_to surveys_path
    end
  end

  def set_question
    @question = Question.find(params[:id])
  end 

  def check_status
    @poll = Poll.find_by_id(params[:id])
    if @poll.draft? && !current_user.admin?
      redirect_to surveys_path
    end
  end
end 
