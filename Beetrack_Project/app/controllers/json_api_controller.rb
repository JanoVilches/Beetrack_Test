class JsonApiController < ApplicationController

  skip_before_action :verify_authenticity_token

  def new_waypoint
    puts params[:latitude], params[:longitude], params[:sent_at], params[:vehicle_identifier]
    
    v = Vehicle.where(idVehicle: params[:vehicle_identifier])
    puts v
    
    if v != []
      puts "modificando posicion de vehiculo"
      
      loc = Location.find_by(vehicle_id: v[0].id, is_actual: 1)
      loc.update(is_actual: 0)

      loc = Location.create(
            latitude: params[:latitude], 
            longitude: params[:longitude],
            sent_at: params[:sent_at],
            vehicle_id: v[0].id,
            is_actual: 1,
      )
    
    else
      puts "añadiendo nuevo vehiculo"
      vehicle = Vehicle.create(idVehicle: params[:vehicle_identifier])

      loc = Location.create(
                    latitude: params[:latitude], 
                    longitude: params[:longitude],
                    sent_at: params[:sent_at],
                    vehicle_id: vehicle.id,
                    is_actual: 1,
                  )
    end


  end

end
