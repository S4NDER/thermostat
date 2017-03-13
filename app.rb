require_relative 'thermostat'              #'hello_world.rb' works too, this line refers to the file

foo = Thermostat.new                      #HelloWorld.new() works too, but () is not neccesary
#puts foo.show_led
foo.ask_unit
foo.ask_range
foo.ask_temp
foo.convert_to_celcius
foo.set_led
foo.show_led
# foo.temperature=21
# puts foo.show_led
#
# foo.temperature=19
# puts foo.show_led
