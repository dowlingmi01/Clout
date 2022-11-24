class Admin::PollsController < Admin::ApplicationController
  before_action :authenticate_user!

  def create
    @poll = Poll.new(poll_params)
    if @poll.save
      flash[:success] = 'Poll was created!'
      redirect_to surveys_path
    else
      redirect_to new_poll_path
    end
  end

  def update
    @poll = Poll.find_by_id(params[:id])
    if @poll.update(poll_params)
      flash[:notice] = 'Poll was updated!'
      redirect_to edit_poll_path(@poll)
    else
      redirect_to edit_poll_path(@poll)
      flash[:notice] = 'Something went wrong!'
    end
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

  private

  def poll_params
    params.require(:poll).permit(:rewards_cash, :experience, :status, questions_attributes: [:_destroy, :id, :topic, :comment, :position, :option_type, vote_options_attributes: [:id, :title, :_destroy]])
  end
end
