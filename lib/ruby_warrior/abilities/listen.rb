module RubyWarrior
  module Abilities
    class Listen < Base
      def description
        "#{R18n.t.listen.description}"
      end
      
      def perform
        @unit.position.floor.units.map do |unit|
          unit.position.space unless unit == @unit
        end.compact
      end
    end
  end
end
