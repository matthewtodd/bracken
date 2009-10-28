module Bracken
  class Logfile

    class Filter < Struct.new(:service, :pattern)
      # FIXME this is heinous
      def match?(line)
        if line.include?(service)
          if pattern
            if line.match(pattern)
              true
            else
              false
            end
          else
            true
          end
        else
          false
        end
      end
    end

  end
end