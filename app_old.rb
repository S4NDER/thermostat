require_relative 'thermostat'              #'hello_world.rb' works too, this line refers to the file
require_relative 'datalogger.rb'
require_relative 'datareader.rb'
require_relative 'temperature_converter'
require_relative 'led'
require_relative 'mqtt_data'

thermostat = Thermostat.new                      #HelloWorld.new() works too, but () is not neccesary
logger = DataLogger.new("thermo_log_2.txt")
datareader = DataReader.new
temperature_converter = TemperatureConverter.new
led = Led.new
mqtt = MqttData.new

if ARGV.empty?
    #Retrieving data
    datareader.read_online_temperature
    datareader.ask_unit
    datareader.ask_ideal_temp
    datareader.ask_range


    #Putting date in local variables
    online_temperature = datareader.get_online_temperature
    unit = datareader.get_unit
    range = datareader.get_range
    ideal_temperature = datareader.get_ideal_temperature
    #temperature = datareader.get_temperature
    puts led.get_led_color

    #datareader.ask_temp

    mqtt.on_change do |value|
        datareader.temperature = value

        temperature_converter.convert_to_celcius(unit, datareader.get_temperature)
        thermostat.control_climate(datareader.get_temperature, ideal_temperature, range)
        led.calculate_color(datareader.get_temperature, ideal_temperature, range)
        puts "mbed: #{datareader.get_temperature}"
        mqtt.send_color_to_mqtt(led.get_led_color)
    end
    puts led.get_led_color
    puts "LED Color: #{led.get_led_color}\n#{thermostat.get_climate_control_state}"
else
    datareader.unit = ARGV[0].downcase
    datareader.ideal_temperature = ARGV[1].to_i
    #puts ARGV[0].downcase.delete!("\n").inspect check output
    datareader.range = ARGV[2].to_i
    datareader.temperature = ARGV[3].to_i

    unit = datareader.get_unit
    ideal_temperature = datareader.get_ideal_temperature
    range = datareader.get_range
    temperature = datareader.get_temperature

    temperature_converter.convert_to_celcius(unit, temperature)
    thermostat.control_climate(temperature, ideal_temperature, range)
    led.calculate_color(temperature, ideal_temperature, range)
    puts led.get_led_color
    puts "LED Color: #{led.get_led_color}\n#{thermostat.get_climate_control_state}"
end
logger.write("LED Color: #{led.get_led_color}\n#{thermostat.get_climate_control_state}")
mqtt.get_mqtt_temperature
