module RubyWarrior
  module Abilities
    class DistanceOf < Base
      def description
        "#{R18n.t.distance_of.description}"
      end
      
      def perform(space)
        @unit.position.distance_of(space)
      end
    end
  end
end
