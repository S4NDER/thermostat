require 'mqtt'
require 'json'

class MqttData

    def get_mqtt_temperature
        temperature_topic = 'softwareengineering/temperature/mbed'
        MQTT::Client.connect('mqtt.labict.be') do |client|
            while true
                client.get(temperature_topic) do |topic,message|
                    return JSON.parse(message)["temperature"]
                end
            end
        end
    end

end
