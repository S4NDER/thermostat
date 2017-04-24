require_relative 'thermostat'              #'hello_world.rb' works too, this line refers to the file
require_relative 'logger.rb'
require_relative 'datareader.rb'
require_relative 'temperature_converter'
require_relative 'led'

thermostat = Thermostat.new                      #HelloWorld.new() works too, but () is not neccesary
logger = Logger.new("thermo_log_2.txt")
datareader = DataReader.new
temperature_converter = TemperatureConverter.new
led = Led.new

if ARGV.empty?
    datareader.read_online_temperature
    datareader.ask_unit
    datareader.ask_ideal_temp
    datareader.ask_range
    datareader.ask_temp
    temperature_converter.convert_to_celcius(datareader.get_unit, datareader.get_temperature)
    thermostat.control_climate(datareader.get_temperature, datareader.get_ideal_temperature, datareader.get_range)
    led.calculate_color(datareader.get_temperature, datareader.get_ideal_temperature, datareader.get_range)
    puts led.get_led_color
else
    datareader.unit = ARGV[0].downcase
    datareader.ideal_temperature = ARGV[1].to_i
    #puts ARGV[0].downcase.delete!("\n").inspect check output
    datareader.range = ARGV[2].to_i
    datareader.temperature = ARGV[3].to_i
    temperature_converter.convert_to_celcius(datareader.get_unit, datareader.get_temperature)
    thermostat.control_climate(datareader.get_temperature, datareader.get_ideal_temperature, datareader.get_range)
    led.calculate_color(datareader.get_temperature, datareader.get_ideal_temperature, datareader.get_range)
    puts led.get_led_color
end
logger.write("LED Color: #{led.get_led_color}\n #{thermostat.get_climate_control_state}")
