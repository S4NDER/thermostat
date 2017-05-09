
require_relative "lib/datalogger.rb"
require_relative "lib/datareader.rb"
require_relative "lib/led.rb"
require_relative "lib/mqtt_data.rb"
require_relative "lib/temperature_converter.rb"
require_relative "lib/thermostat.rb"

require 'optparse'

temperature_converter = TemperatureConverter.new
logger = DataLogger.new("thermo_log.txt");
thermostat = Thermostat.new
datareader = DataReader.new
mqtt = MqttData.new
led = Led.new

options = {:unit => nil, :range => nil, :ideal_temperature => nil}
OptionParser.new do |opts|
  opts.banner = "Usage: app.rb [options]"

  opts.on("-u", "--unit U", "Temperature unit") do |unit|
    options[:unit] = unit
    datareader.unit = unit
  end

  opts.on( "-i", "--ideal_t I", "Ideal temperature") do |ideal_temperature|
    options[:ideal_temperature] = ideal_temperature
    datareader.ideal_temperature = ideal_temperature
  end

  opts.on("-r", "--range R", "Temperature range") do |range|
    options[:range] = range
    datareader.range = range
  end
end.parse!

#Putting date in local variables
online_temperature = datareader.get_online_temperature
unit = datareader.get_unit
range = datareader.get_range
ideal_temperature = datareader.get_ideal_temperature
#temperature = datareader.get_temperature
puts led.get_led_color

mqtt.on_change do |value|
    datareader.temperature = value

    temperature_converter.convert_to_celcius(unit, datareader.get_temperature)
    thermostat.control_climate(datareader.get_temperature, ideal_temperature, range)
    led.calculate_color(datareader.get_temperature, ideal_temperature, range)
    puts "mbed: #{datareader.get_temperature}"
    mqtt.send_color_to_mqtt(led.get_led_color)
end

logger.write("LED Color: #{led.get_led_color}\n#{thermostat.get_climate_control_state}")
mqtt.get_mqtt_temperature
