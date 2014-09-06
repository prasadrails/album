class UsersController < ApplicationController
	before_filter :authenticate_user!, :only => [:show]

  def show
  	# show user information
  	@user = current_user
  	# show albums created by this user
  	@albums = @user.albums
  end
end
