module RubyWarrior
  module Abilities
    class DirectionOfStairs < Base
      def description
        "#{R18n.t.direction_of_stairs.description}"
      end
      
      def perform
        @unit.position.relative_direction_of_stairs
      end
    end
  end
end
