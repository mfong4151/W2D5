require_relative 'passenger'

class Flight

    attr_reader :passengers

    def initialize(flight_no, capacity)
        @flight_number = flight_no
        @capacity = capacity
        @passengers = []

    end 

    def full?
        return true if @passengers.length >= @capacity
        false
    end 

    def board_passenger(passenger)
       @passengers << passenger if !self.full? and passenger.has_flight?@flight_number
    end 

    def list_passengers
        @passengers.map!{|passenger| passenger.name }
    end 

    def [](number)
        @passengers[number]
    end 

    def <<(passenger)
        self.board_passenger(passenger)
    end 

        
end