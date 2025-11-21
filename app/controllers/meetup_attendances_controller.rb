class MeetupAttendancesController < ApplicationController
  before_action :set_meetup

  def create
    # Join the meetup
    current_user.meetup_attendances.create(meetup: @meetup)
    redirect_to @meetup, notice: "You joined the meetup!"
  end

  def destroy
    # Leave the meetup
    attendance = current_user.meetup_attendances.find_by(meetup: @meetup)
    attendance&.destroy
    redirect_to @meetup, notice: "You left the meetup."
  end

  private

  def set_meetup
    @meetup = Meetup.find(params[:meetup_id])
  end
end
