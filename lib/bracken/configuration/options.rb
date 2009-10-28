require 'optparse'

module Bracken
  class Configuration

    class Options
      attr_reader :configuration_file
      attr_reader :number_of_lines

      def initialize
        @configuration_file = '/etc/bracken.rb'
        @number_of_lines    = 1000
      end

      def parse(arguments)
        arguments.extend(::OptionParser::Arguable)

        arguments.options do |opts|
          opts.on('-c', '--config-file=PATH', 'Read configuration from PATH.', '[/etc/bracken.rb]') do |path|
            @configuration_file = path
          end

          opts.on('-n', '--lines=N', Integer, 'Tail the last N lines from each file.', '[1000]') do |number|
            @number_of_lines = number
          end
        end.parse!
      end
    end

  end
end