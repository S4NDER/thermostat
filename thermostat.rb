

class Thermostat
    attr_reader :cooling
    attr_reader :heating

    def initialize
        @cooling = false
        @heating = false
    end

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

    # def show_led
    #     #@temperature = @temperature.round(2)
    #     puts "LED color: #{@led_color}, the temp. is #{'%.2f' % @temperature} °C"
    #     if @cooling
    #         puts "Cooling is enabled"
    #         @message = "Cooling is enabled"
    #     elsif @heating
    #         puts "Heating is enabled"
    #         @message = "Heating is enabled"
    #     else
    #         @message = "No climate devices are enabled"
    #     end
    #
    #     #log_data(message)
    #     #write(message)
    # end
end
