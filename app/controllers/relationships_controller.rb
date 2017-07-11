class RelationshipsController < ApplicationController
  def create
    #user_id and friend_id
    #user_id = current user
    #friend_id = params - from profile page
    @relationship = current_user.relationships.build(friend_id: params[:friend_id])

    #save it
    if @relationship.save
      # TODO: flash the friend's name in the follow notice popup
      flash[:notice] = "You're now friends"
      redirect_to profile_path(params[:friend_id])
    else
      flash[:notice] = "Something went wrong"
      redirect_to profile_path(params[:friend_id])
    end

  end

  def destroy
    #find relationship to destroy
    @relationship = current_user.relationships.find(params[:id])
    #smash it
    @relationship.destroy
    #flash notice
    flash[:notice] = "No longer following"
    #redirect to all tweets
    redirect_to root_path

  end

  private

  def relationship_params
    params.require(:relationship).permit(:user_id, :friend_id)

  end
end
