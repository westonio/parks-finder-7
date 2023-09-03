class Park
  attr_reader :name, :description, :directions, :operating_hours

  def initialize(park_data)
    @name = park_data[:fullName]
    @description = park_data[:description]
    @directions = park_data[:directionsInfo]
    @operating_hours = park_data[:operatingHours].first[:standardHours]
  end
end