module RubyWarrior
  module Abilities
    class Walk < Base
      def description
        "#{R18n.t.direction.move_forward_default}"
      end
      
      def perform(direction = :forward)
        verify_direction(direction)
        if @unit.position
          @unit.say "#{R18n.t.walk.s} #{direction}"
          if space(direction).empty?
            @unit.position.move(*offset(direction))
          else
            @unit.say "#{R18n.t.direction.bumps_into} #{space(direction)}"
          end
        end
      end
    end
  end
end
