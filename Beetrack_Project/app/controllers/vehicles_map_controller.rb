require 'json'

class VehiclesMapController < ApplicationController

  def show
    @data = []
    
    vehicles = Vehicle.all()
    
    for v in vehicles
      locations = Location.where(is_actual: 1, vehicle_id: v.id)
      
      for l in locations
        h = Hash.new
        h[:latitude] = l.latitude
        h[:longitude] = l.longitude
        h[:vehicle] = v.idVehicle

        @data.push(h)
      end
    end

    @data = @data.to_json

    puts @data
  end

end
