require 'bracken/configuration/builder'
require 'bracken/configuration/options'

module Bracken
  class Configuration
    attr_reader :options
    attr_reader :builder
    attr_reader :files

    def initialize
      @options = Options.new
      @builder = Builder.new(self)
      @files   = []
    end

    def parse(arguments)
      options.parse(arguments)
      builder.parse(options.configuration_file)
      self
    end

    def streams
      files.map { |file| file.stream }
    end
  end
end