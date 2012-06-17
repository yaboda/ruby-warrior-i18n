module RubyWarrior
  module Abilities
    class DirectionOf < Base
      def description
        "#{R18n.t.direction_of.description}"
      end
      
      def perform(space)
        @unit.position.relative_direction_of(space)
      end
    end
  end
end
