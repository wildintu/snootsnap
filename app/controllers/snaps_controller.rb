class SnapsController < ApplicationController
  def index
    # Load all snaps newest first
    @snaps = Snap.order(created_at: :desc)
  end

  def show
    @snap = Snap.find(params[:id])
  end

  def new
    @snap = Snap.new
  end

  def create
    @snap = Snap.new(snap_params)
    @snap.user = current_user

    if @snap.save
      redirect_to snaps_path, notice: "Snap created!"
    else
      render :new
    end
  end

  def destroy
    @snap = Snap.find(params[:id])
    @snap.destroy
    redirect_to snaps_path, notice: "Snap deleted!"
  end

  def highlight
    # Optional: add snap to highlights
  end

  private

  def snap_params
    params.require(:snap).permit(:caption, :image, :expires_at, :meetup_id)
  end
end

