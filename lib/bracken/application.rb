module Bracken
  class Application
    def self.execute(arguments)
      new.execute(arguments)
    end

    attr_reader :configuration

    def initialize
      @configuration = Configuration.new
    end

    def execute(arguments)
      configuration.parse(arguments)

      while activity = IO.select(configuration.streams)
        streams = activity.first

        streams.each do |stream|
          line = stream.filtered_gets

          if line
            STDOUT.puts line
            STDOUT.flush
          end
        end
      end
    end
  end
end
