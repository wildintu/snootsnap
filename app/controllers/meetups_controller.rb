class MeetupsController < ApplicationController
  before_action :set_meetup, only: [ :show, :edit, :update, :destroy, :join, :leave ]

  def index
    @meetups = Meetup.order(start_time: :asc)
  end

  def show
    @feedback = TrustFeedback.new
  end

  def new
    @meetup = current_user.organized_meetups.build
  end

  def create
    @meetup = current_user.organized_meetups.build(meetup_params)
    if @meetup.save
      redirect_to @meetup, notice: "Meetup created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @meetup.update(meetup_params)
      redirect_to @meetup, notice: "Meetup updated!"
    else
      render :edit
    end
  end

  def destroy
    @meetup.destroy
    redirect_to meetups_path, notice: "Meetup deleted!"
  end

  # Custom actions
  def join
    current_user.meetup_attendances.create(meetup: @meetup)
    redirect_to @meetup, notice: "You joined the meetup!"
  end

  def leave
    attendance = current_user.meetup_attendances.find_by(meetup: @meetup)
    attendance&.destroy
    redirect_to @meetup, notice: "You left the meetup."
  end

  private

  def set_meetup
    @meetup = Meetup.find(params[:id])
  end

  def meetup_params
    params.require(:meetup).permit(:title, :description, :location_name, :latitude, :longitude, :start_time, :end_time)
  end
end
