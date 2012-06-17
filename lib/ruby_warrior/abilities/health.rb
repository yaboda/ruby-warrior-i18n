module RubyWarrior
  module Abilities
    class Health < Base
      def description
        "#{R18n.t.health.description}"
      end
      
      def perform
        @unit.health
      end
    end
  end
end
