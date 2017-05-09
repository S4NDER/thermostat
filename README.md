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
<iframe> https://sillevl.gitbooks.io/course-software-engineering/content/excercise/thermostat.html </iframe>

## Licensing
MIT License
