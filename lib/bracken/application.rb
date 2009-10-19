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
          STDOUT.puts stream.event
          STDOUT.flush
        end
      end
    end
  end
end
