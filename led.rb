class Led
    attr_accessor :color

    def calculate_color (temperature, ideal_temperature, range)
        colorstep = 255 / ((ideal_temperature + range) - (ideal_temperature - range))
        gradient = temperature - (ideal_temperature-range)

        if gradient.abs > ((ideal_temperature + range) - (ideal_temperature - range))
            gradient = ((ideal_temperature + range) - (ideal_temperature - range))
        end

        hexcolor = colorstep * gradient.abs

        if temperature < (ideal_temperature - range)
            intensity = hexcolor.abs.to_s(16)
            intensity.slice!(0)
            @color = "0000#{hexcolor.abs.to_s(16)}"
        elsif temperature > (ideal_temperature + range)
            intensity = hexcolor.abs.to_s(16)
            intensity.slice!(0)
            @color = "#{hexcolor.abs.to_s(16)}0000"
        else
            @color = "00#{hexcolor.abs.to_s(16)}00"
        end
    end

    def get_led_color
        return @color
    end
end
