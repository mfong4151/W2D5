class Item

    #checks if input has a valid date
    def self.is_valid?(date_string) 
        year, month, day = date_string.split('-')
        month = month.to_i
        day = day.to_i
        return false if year.length < 4 or (month > 12 or month < 0) or (day > 31 or day < 0)
        true    
    end

    attr_reader :title, :deadline, :description, :done
    attr_writer :new_description

    def initialize(title, deadline, description)

        if !Item.is_valid?deadline
            raise RuntimeError.new('Your input is not a valid date. Please insert a valid date.')
        end
        @title, @deadline, @description = title, deadline, description
        @done = false

    end

    def deadline=(new_deadline)
        if !Item.is_valid?deadline
            raise ArgumentError.new('Your input is not a valid date. Please insert a valid date.')
        end

        @deadline = new_deadline
    end
    
    def toggle
        if @done == false
            @done = true 
        else
            @done = false

        end
    end
end