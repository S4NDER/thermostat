require 'openssl'
require 'open-uri'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class DataReader
    attr_writer :online_data
    attr_writer :unit
    attr_writer :range
    attr_writer :ideal_temperature
    attr_writer :temperature

    def read_online_temperature
        temperature_uri = "https://labict.be/software-engineering/temperature/api/temperature/fake"
        @online_data = URI.parse(temperature_uri).read
    end

    def get_online_temperature
        return @online_data
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

    def get_unit
        return @unit
    end

    def get_range
        return @range
    end

    def get_ideal_temperature
        return @ideal_temperature
    end

    def get_temperature
        return @temperature
    end
end