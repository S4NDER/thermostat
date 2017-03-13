class Thermostat
    attr_accessor :temperature
    attr_accessor :range
    attr_accessor :led
    attr_accessor :unit

    def initialize(temperature = 20, range = 1, unit="c")
        @temperature = temperature
        @range = range
        @unit = unit
    end

    def convert_to_celcius
        puts "Conversion from #{@unit} to °C"
        if @unit == "f"
            @temperature = @temperature *1.8 +32
        elsif @unit == "k"
            @temperature = @temperature - 272.15
        end
        #@temperature
    end

    def ask_unit
        puts "Whats your temp. unit? [C]celcius, [F]Fahrenheit, [K]Kelvin"
        @unit = gets.downcase.delete!("\n")
        puts "Chosen unit is #{@unit}"
    end

    def ask_range
        puts "Whats your range?"
        @range = gets.to_i
    end

    def ask_temp
        puts "Whats the temp?"
        @temperature = gets.to_i
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
    end

    def show_led
        puts "LED color: #{@led}, the temp. is #{@temperature} °C"
    end
end
