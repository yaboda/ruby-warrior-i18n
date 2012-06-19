module RubyWarrior
  module Abilities
    class Attack < Base
      def description
        "#{R18n.t.attack.in_given_direction}"
      end
      
      def perform(direction = :forward)
        verify_direction(direction)
        receiver = unit(direction)
        if receiver
          @unit.say "#{R18n.t.attack.and_hits(R18n.t.direction[direction], receiver)}"
          if direction == :backward
            power = (@unit.attack_power/2.0).ceil
          else
            power = @unit.attack_power
          end
          damage(receiver, power)
        else
          @unit.say "#{R18n.t.attack.and_hits_nothing(R18n.t.direction[direction])}"
        end
      end
    end
  end
end
