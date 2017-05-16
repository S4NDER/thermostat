class TemperatureConverter
    attr_writer :converterd_temperature

# Converts temperature to °C
# example: convert_to_celcius(k, 275)
    def convert_to_celcius(unit, temperature)
        if unit == "f"
            @converterd_temperature = (temperature-32) / 1.8
        elsif unit == "k"
            @converterd_temperature = temperature - 272.15
        end
    end

    def get_converted_temperature
        return @converterd_temperature
    end
end
