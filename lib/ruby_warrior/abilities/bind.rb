module RubyWarrior
  module Abilities
    class Bind < Base
      def description
        "#{R18n.t.bind.description}"
      end
      
      def perform(direction = :forward)
        verify_direction(direction)
        receiver = unit(direction)
        if receiver
          @unit.say R18n.t.bind.and_restricts(R18n.t.direction[direction], "#{receiver}")
          receiver.bind
        else
          @unit.say "#{R18n.t.bind.and_restricts_nothing(R18n.t.direction[direction])}"
        end
      end
    end
  end
end
