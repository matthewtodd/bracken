require 'bracken/logfile/filter'
require 'bracken/logfile/stream'
require 'open4'

module Bracken
  class Logfile
    attr_reader :filters
    attr_reader :number_of_lines
    attr_reader :path

    def initialize(path, number_of_lines)
      @filters         = []
      @number_of_lines = number_of_lines
      @path            = path
    end

    def stream
      @stream ||= begin
        pid, _, out, _ = Open4.popen4("tail -n #{number_of_lines} -F #{path}")

        out.extend(Stream)
        out.logfile = self
        out.pid     = pid

        out
      end
    end
  end
end
