module RubyWarrior
  module Abilities
    class Look < Base
      def description
        "#{R18n.t.look.description}"
      end
      
      def perform(direction = :forward)
        verify_direction(direction)
        [1, 2, 3].map do |amount|
          space(direction, amount)
        end
      end
    end
  end
end
