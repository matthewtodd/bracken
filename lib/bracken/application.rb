require 'bracken/configuration'

module Bracken
  class Application
    def self.execute!(*arguments)
      new(arguments).execute!
    end

    def initialize(arguments)
      @arguments = arguments
    end

    def execute!
      configuration.mode.execute!
    end

    private

    def configuration
      @configuration ||= Configuration.new(@arguments)
    end
  end
end
