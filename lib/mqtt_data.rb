require 'mqtt'
require 'json'

class MqttData

    def on_change &block
        @on_change_block = block
    end

    def get_mqtt_temperature
        temperature_topic = 'softwareengineering/thermostat/s4nder/temperature'
        MQTT::Client.connect('mqtt.labict.be') do |client|
            while true
                client.get(temperature_topic) do |topic,message|
                    parsed_temperature = JSON.parse(message)["temperature"]
                    #client.publish('softwareengineering/thermostat/s4nder/led', '{"color": "FF0000"}', retain=false)
                    @on_change_block.call(parsed_temperature.to_f) unless @on_change_block.nil?
                end
            end
        end
    end

    def send_color_to_mqtt (color)
        temperature_topic = 'softwareengineering/thermostat/s4nder/temperature'
        client2 = MQTT::Client.connect('mqtt.labict.be')
        hash = {"color" => color}
        payload = JSON.generate(hash)
        client2.publish('softwareengineering/thermostat/s4nder/led', payload, retain=false)
    end

end
