module RubyWarrior
  module Abilities
    class Pivot < Base
      ROTATION_DIRECTIONS = [:forward, :right, :backward, :left]
      
      def description
        "#{R18n.t.rotate.description}"
      end
      
      def perform(direction = :backward)
        verify_direction(direction)
        @unit.position.rotate(ROTATION_DIRECTIONS.index(direction))
        @unit.say "#{R18n.t.rotate.pivots} #{direction}"
      end
    end
  end
end
