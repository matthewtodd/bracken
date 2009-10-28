require 'bracken/logfile/filter'
require 'open4'

module Bracken
  class Logfile
    attr_reader :filters
    attr_reader :path

    def initialize(path)
      @filters = []
      @path    = path
    end

    def stream
      @stream ||= begin
        pid, _, out, _ = Open4.popen4("tail -f #{path}")

        # TODO extract a Stream module and out.extend(Stream.new(pid))
        class << out
          attr_accessor :logfile
          attr_accessor :pid

          # FIXME this could use work
          def filtered_gets
            line = gets
            line if logfile.filters.empty? || logfile.filters.any? { |filter| filter.match?(line) }
          end

          def kill
            Process.kill('TERM', pid)
            Process.wait(pid)
          end
        end

        out.logfile = self
        out.pid     = pid

        out
      end
    end
  end
end
