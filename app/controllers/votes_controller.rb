class VotesController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized

  def create
    @question = Question.find_by_id(params[:question][:id])
    if @question.option_type == "single_select"
      if current_user && params[:question] && params[:question][:id] && params[:vote_option] && params[:vote_option][:id] && !@question.poll.draft? && !@question.poll.closed?
        @question = Question.find_by_id(params[:question][:id])
        @option = @question.vote_options.find_by_id(params[:vote_option][:id])
        if @option && @question && !current_user.voted_for?(@question)
          current_user.votes.create({vote_option_ids: @option.id})
        else
          redirect_to polls_path(@poll), notice: "Your vote cannot be saved. Have you already voted?" 
        end
      else
        redirect_to polls_path(@poll), notice: "Please select an option." 
      end
    else
      if current_user && params[:question] && params[:question][:id] && params[:vote_option_ids] && !@question.poll.draft? && !@question.poll.closed?
        @question = Question.find_by_id(params[:question][:id])
        @options = @question.vote_options.find(params[:vote_option_ids])
        if @options && @question && !current_user.voted_for?(@question)
          current_user.votes.create({vote_options: @options})
        else
          redirect_to polls_path(@poll), notice: "Your vote cannot be saved. Have you already voted?" 
        end
      else
        redirect_to polls_path(@poll), notice: "Please select an option." 
      end
  end
end
end