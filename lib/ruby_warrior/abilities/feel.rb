module RubyWarrior
  module Abilities
    class Feel < Base
      def description
        "#{R18n.t.feel.description}"
      end
      
      def perform(direction = :forward)
        verify_direction(direction)
        space(direction)
      end
    end
  end
end
