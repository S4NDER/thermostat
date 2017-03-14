require_relative 'thermostat'              #'hello_world.rb' works too, this line refers to the file

#https://labict.be/software-engineering/temperature/api/temperature/fake

thermostat = Thermostat.new                      #HelloWorld.new() works too, but () is not neccesary
#puts thermostat.show_led
if ARGV.empty?
    thermostat.ask_ideal_temp
    thermostat.ask_unit
    thermostat.ask_range
    thermostat.ask_temp
    thermostat.convert_to_celcius
    thermostat.set_led
    thermostat.show_led
else
    thermostat.unit = ARGV[0].downcase
    thermostat.ideal_temperature = ARGV[1].to_i
    #puts ARGV[0].downcase.delete!("\n").inspect check output
    thermostat.range = ARGV[2].to_i
    thermostat.temperature = ARGV[3].to_i
    thermostat.convert_to_celcius
    thermostat.set_led
    thermostat.show_led
end
