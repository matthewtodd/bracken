module Bracken
  class Logfile

    class Event
      attr_reader :original

      def initialize(original)
        @original = original
      end
    end

  end
end