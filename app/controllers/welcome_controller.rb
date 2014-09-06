class WelcomeController < ApplicationController
  def index
  	# shows latest 25 images
  	@photos = Photo.all.order("created_at").limit(25)
  end
end
