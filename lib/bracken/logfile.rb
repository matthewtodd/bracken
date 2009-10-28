require 'open4'

module Bracken
  class Logfile
    attr_reader :path

    def initialize(path)
      @path = path
    end

    def stream
      @stream ||= begin
        pid, _, out, _ = Open4.popen4("tail -f #{path}")

        class << out
          attr_accessor :pid

          def kill
            Process.kill('TERM', pid)
            Process.wait(pid)
          end
        end

        out.pid = pid

        out
      end
    end
  end
end
