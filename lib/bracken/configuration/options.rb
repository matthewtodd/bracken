require 'optparse'

module Bracken
  class Configuration

    class Options
      attr_reader :configuration_file

      def initialize
        @configuration_file = '/etc/bracken.rb'
      end

      def parse(arguments)
        arguments.extend(::OptionParser::Arguable)

        arguments.options do |opts|
          opts.on('-c', '--config-file PATH', 'Read configuration from PATH.', '[/etc/bracken.rb]') do |path|
            @configuration_file = path
          end
        end.parse!
      end
    end

  end
end