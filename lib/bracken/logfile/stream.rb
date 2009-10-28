module Bracken
  class Logfile

    module Stream
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

  end
end