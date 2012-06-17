module RubyWarrior
  module Units
    class Golem < Base
      attr_writer :turn
      attr_accessor :max_health
      
      def play_turn(turn)
        @turn.call(turn) if @turn
      end
      
      def attack_power
        3
      end
      
      def character
        "#{R18n.t.golem.first_letter}"
      end
    end
  end
end
