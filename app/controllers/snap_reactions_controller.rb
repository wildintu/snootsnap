class SnapReactionsController < ApplicationController
  def create
    @snap = Snap.find(params[:snap_id])
    @reaction = @snap.snap_reactions.create(user: current_user, emoji: params[:emoji])
    redirect_to snaps_path
  end

  def destroy
    @reaction = current_user.snap_reactions.find(params[:id])
    @reaction.destroy
    redirect_to snaps_path
  end
end
