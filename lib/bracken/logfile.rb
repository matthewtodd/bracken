require 'bracken/logfile/filter'
require 'bracken/logfile/stream'
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

        out.extend(Stream)
        out.logfile = self
        out.pid     = pid

        out
      end
    end
  end
end
