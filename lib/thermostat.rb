class Thermostat
    attr_reader :cooling
    attr_reader :heating

    def initialize
        @cooling = false
        @heating = false
    end

# Checks if climate control needs to bee enabled.
# control_climate(temperature, ideal_temperature, range)
# example:  control_climate(20, 18, 1)
    def control_climate (temperature, ideal_temperature, range)
        if temperature <= (ideal_temperature - range)
            @heating = true
            @cooling = false
        elsif temperature >= (ideal_temperature + range)
            @heating = false
            @cooling = true
        else
            @heating = false
            @cooling = false
        end
    end

    def get_climate_control_state
        if @heating
            return "Heating is enabled"
        elsif @cooling
            return "Cooling is enabled"
        else
            return "Cooling and heating are disabled"
        end

    end
end
