class Thermostat
    attr_accessor :temperature
    attr_accessor :range
    attr_accessor :led

    def initialize(temperature = 20, range = 1)
        @temperature = temperature
        @range = range
        ask_range
    end

    def ask_range
        puts "Whats your range?"
        @range = gets.to_i
        ask_temp
    end

    def ask_temp
        puts "Whats the temp?"
        @temperature = gets.to_i
        set_led
    end

    def set_led
        led
        if @temperature <= (20-@range)
            @led = "blue"
        elsif @temperature >= (20+@range)
            @led = "red"
        else
            @led = "green"
        end
        show_led
    end

    def show_led
        puts "LED color: #{@led}, the temp. is #{@temperature} °C"
    end
end
