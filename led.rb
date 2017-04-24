class Led
    attr_accessor :color

    def calculate_color (temperature, ideal_temperature, range)
        if temperature <= (ideal_temperature - range)
            #@color = "0000FF"
            @color = 0x0000FF
        elsif temperature >= (ideal_temperature + range)
            #@color = "FF0000"
            @color = 0xFF0000
        else
            #@color = "00FF00"
            @color = 0x00FF00
        end
    end

    def get_led_color
        return @color
    end

end
