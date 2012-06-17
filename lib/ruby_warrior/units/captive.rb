module RubyWarrior
  module Units
    class Captive < Base
      def initialize
        bind
      end
      
      def max_health
        1
      end
      
      def character
        "#{R18n.t.captive.first_letter}"
      end
    end
  end
end
