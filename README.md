# Thermostat
## Description
> This thermostat gets temperature data from an mBed via MQTT. This software sets
 the RGB led on the mBed based on your arguments to a certain color. The color is
 based on your given temperature range in which you define how much the temperature
 may be more or may be less to be still a comfortable temperature. An ideal
 temperature is the middle for your range.
>> Example: <br>
Your range is 2 <br>
Your ideal temperature is 20 (ex. °C) <br>
The thermostat will read temperature between 18°C and 22°C as comfortable.

## How To Install
## How To Use
Unit can only be "c", "f" or "k" (may also be capitalized)
```powershell
thermostat --r <int> --i <int> --u <string>
thermostat --range <int> --ideal_t <int> --unit <string>
thermostat --range 2 --ideal_t 21 --unit c
```
## Setting Up The Enviroment
## Shipping Change
## Changelog
* v0.0.1
> A Ruby application that can set the wanted temperature value and a range to calculate the output states. Output states can be:
Heating: ON/OFF
Cooling: ON/OFF
RGB-LED:
BLUE: to cold
GREEN: OK
RED: to hot
Text format of the temperatures

* v0.0.2
>The application supports different temperature units such as:
Celsius
Fahrenheit
Kelvin
These units can be set for input and output values separately.

* v0.0.3
>Instead of hard-coding temperatures, the values must be supplied using command-line arguments. For example the following command could be used to execute the thermostat application:
ruby app.rb 25 1 23
In the above example, the following values are used:
25: Wanted temperature
1: Range
23: Current temperature
An example of the output could be:
Current temperature: 23°C, Wanted value is 25°C
Cooling: false, Heating: true
RGB Color: #0000FF

* v0.0.4
> Instead of a give value, the current temperature must be supplied using an HTTP URL.
For example: https://labict.be/software-engineering/temperature/api/temperature/fake

* v0.0.5
> The output values and states can be formatted into a JSON format. The unit for the output can be configured and choosen

* v0.0.6
> The RGB-LED now supports full color values instead of only RED, GREEN and BLUE.

* v0.0.7
> Add MQTT support for:
Subsciption to an temperature sensor
Publish RGB-color to an actual RGB LED
both situations could be implemented with an mbed in combination with an application board: https://developer.mbed.org/users/sillevl/code/MQTT-Thermostat-example/

* v0.1.0
> Convert the application to an real command-line application by using the OptionParser class that is included in the Ruby standard library. All previous implemented features should be supported, but the command-line options should not be backward compatible.

* v0.1.1
> Convert the application into a Ruby Gem and publish it on rubygems.org.
Note: name your ruby gem FIRSTNAME-LASTNAME-thermostat-exercise (fill in your first and last name). This is not to pollute the global namespace of gems.

## Licensing
MIT License
