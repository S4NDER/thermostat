class Led
    attr_accessor :color

    def calculate_color (temperature, ideal_temperature, range)
        colorstep = 255 / ((ideal_temperature + range) - (ideal_temperature - range))
        gradient = temperature - (ideal_temperature-range)
        hexcolor = colorstep * gradient

        if temperature < (ideal_temperature - range)
            @color = "0000#{hexcolor.abs.to_s(16)}"
        elsif temperature > (ideal_temperature + range)
            @color = "#{hexcolor.abs.to_s(16)}0000"
        else
            @color = "00#{hexcolor.abs.to_s(16)}00"
        end
    end

    def get_led_color
        return @color
    end
end


# Calculate dynamic color
# ideal +- range
# ex. 20 range 2 --> 18 and 22 within range
# color step = 255 / range steps(ideal max - ideal min)
# gradient = current temp - (min ideal)
# hex color = colorstep * gradient
