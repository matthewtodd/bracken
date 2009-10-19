require 'optparse'

module Bracken
  class Configuration

    class Builder
      attr_reader :configuration
      attr_reader :output_stream
      attr_reader :error_stream

      def initialize(configuration, output_stream = STDOUT, error_stream = STDERR)
        @configuration = configuration
        @output_stream = output_stream
        @error_stream  = error_stream
      end

      def parse(pathname)
        if File.exist?(pathname)
          instance_eval(File.read(pathname), pathname)
        else
          error_stream.puts("WARNING file #{pathname} does not exist!")
        end
      end

      def file(path)
        configuration.files << Logfile.new(path)
      end
    end

  end
end