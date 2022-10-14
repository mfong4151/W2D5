class Passenger

    attr_reader :name #:flight_numbers
    #attr_writer :name, :flight_numbers

    def initialize(name)

        @name = name
        @flight_numbers = []

    end

    def has_flight?(flight_no)
        return true if @flight_numbers.include?flight_no.upcase
        false
    end

    def add_flight(flight_no)
        @flight_numbers << flight_no.upcase if !has_flight?(flight_no)
    end

end