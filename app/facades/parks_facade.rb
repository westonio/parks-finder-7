class ParksFacade
  attr_reader :state

  def initialize(state)
    @state = state
  end

  def state_parks
    service = ParksService.new
    json = service.get_parks(@state)
    json[:data].map do |park_data|
      Park.new(park_data)
    end
  end

  def total_parks
    service = ParksService.new
    json = service.get_parks(@state)
    json[:total]
  end
end