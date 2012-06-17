module RubyWarrior
  module Abilities
    class Shoot < Base
      def description
        "#{R18n.t.shoot.description}"
      end
      
      def perform(direction = :forward)
        verify_direction(direction)
        receiver = multi_unit(direction, 1..3).compact.first
        if receiver
          @unit.say "#{R18n.t.shoot.and_hits(direction, receiver)}"
          damage(receiver, @unit.shoot_power)
        else
          @unit.say "#{R18n.t.shoot.and_hits_nothing}"
        end
      end
      
      def multi_unit(direction, range)
        range.map { |n| unit(direction, n) }
      end
    end
  end
end
