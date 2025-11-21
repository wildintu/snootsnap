class TrustFeedbacksController < ApplicationController
  def create
    @meetup = Meetup.find(params[:meetup_id])
    @feedback = @meetup.trust_feedbacks.build(feedback_params.merge(user: current_user))

    if @feedback.save
      redirect_to @meetup, notice: "Feedback submitted!"
    else
      redirect_to @meetup, alert: "Could not submit feedback."
    end
  end

  private

  def feedback_params
    params.require(:trust_feedback).permit(:rating, :comment)
  end
end
