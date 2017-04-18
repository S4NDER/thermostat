class Thermostat
    attr_accessor :temperature
    attr_accessor :range
    attr_accessor :led
    attr_accessor :unit
    attr_accessor :ideal_temperature

    def initialize(temperature = 20, range = 1, unit="c", ideal_temperature = 20)
        @ideal_temperature = ideal_temperature
        @temperature = temperature
        @range = range
        @unit = unit
        @heating = false
        @cooling = false
        @led_color = "000000"
    end

    def convert_to_celcius
        if @unit == "f"
            @temperature = (@temperature-32) / 1.8
            @ideal_temperature = (@ideal_temperature-32) / 1.8
            puts @temperature
            puts @ideal_temperature
        elsif @unit == "k"
            @temperature = @temperature - 272.15
            @ideal_temperature = @ideal_temperature -272.15
        end
    end

    def ask_unit
        puts "Whats your temp. unit? [C]celcius, [F]Fahrenheit, [K]Kelvin"
        @unit = gets.downcase.delete!("\n")
    end

    def ask_range
        puts "Whats your range?"
        @range = gets.to_i
    end

    def ask_ideal_temp
        puts "Whats the ideal temperature?"
        @ideal_temperature = gets.to_i
    end

    def ask_temp
        puts "Whats the temperature?"
        @temperature = gets.to_i
    end

    def set_led
        led
        if @temperature <= (@ideal_temperature-@range)
            @led_color = "0000FF"
            @cooling = false
            @heating = true
        elsif @temperature >= (@ideal_temperature+@range)
            @led_color = "FF0000"
            @cooling = true
            @heating = false
        else
            @led_color = "00FF00"
            @cooling = false
            @heating = false
        end
    end

    def show_led
        #@temperature = @temperature.round(2)
        puts "LED color: #{@led_color}, the temp. is #{'%.2f' % @temperature} °C"
        if @cooling
            puts "Cooling is enabled"
            message = "Cooling is enabled"
        elsif @heating
            puts "Heating is enabled"
            message = "Heating is enabled"
        else
            message = "No climate devices are enabled"
        end

        log_data(message)

    end

    def log_data(message)
        File.open('thermo_log.txt', 'a') do |file|
            file.write Time.now
            file.write "\n#{message}\n"
            file.write "LED color: #{@led_color}\n\n"
        end
    end
end
