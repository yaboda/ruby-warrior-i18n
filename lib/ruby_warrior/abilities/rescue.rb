module RubyWarrior
  module Abilities
    class Rescue < Base
      def description
        "#{R18n.t.rescue.description}"
      end
      
      def perform(direction = :forward)
        verify_direction(direction)
        if space(direction).captive?
          recipient = unit(direction)
          @unit.say R18n.t.rescue.unbinds_and_rescues(R18n.t.direction[direction], "#{recipient}")
          recipient.unbind
          if recipient.kind_of? Units::Captive
            recipient.position = nil
            @unit.earn_points(20)
          end
        else
          @unit.say "#{R18n.t.rescue.unbinds_and_rescues_nothing(direction)}"
        end
      end
    end
  end
end
