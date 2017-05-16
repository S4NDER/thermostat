class Led
    attr_accessor :color

# Calculate the color gradient base on the temperature, ideal temperature and range
# example: calculate_color(20, 21,2)

    def calculate_color (temperature, ideal_temperature, range)
        colorstep = 255 / ((ideal_temperature + range) - (ideal_temperature - range))
        gradient = temperature - (ideal_temperature-range)

        if gradient.abs > ((ideal_temperature + range) - (ideal_temperature - range))
            gradient = ((ideal_temperature + range) - (ideal_temperature - range))
        end

        hexcolor = colorstep * gradient.abs

        if temperature < (ideal_temperature - range)
            @color = "0000#{hexcolor.to_i.abs.to_s(16)}"
        elsif temperature > (ideal_temperature + range)
            @color = "#{hexcolor.to_i.abs.to_s(16)}0000"
        else
            @color = "00#{hexcolor.to_i.abs.to_s(16)}00"
        end
    end

    def get_led_color
        return @color
    end
end
