class JsonApiController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new_waypoint
    puts params[:latitude], params[:longitude], params[:sent_at], params[:vehicle_identifier]

  end

end
