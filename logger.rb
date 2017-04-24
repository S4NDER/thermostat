class Logger
    attr_reader :filename

    def initialize ( filename )
        @filename = filename
    end

    def write ( data )
        File.open(@filename, 'a') do |file|
            file.write Time.now
            file.write "\n#{data}\n"
        end
    end
end
