class ProfilesController < ApplicationController
  def index
    # All the users (which is all the profiles)
    @users = User.all
  end

  def show
    #One particular user
    @user = User.find(params[:id])
  end
end
