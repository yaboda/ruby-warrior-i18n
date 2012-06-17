module RubyWarrior
  module Abilities
    class Explode < Base
      attr_accessor :time
      
      def description
        "#{R18n.t.explode.description}"
      end
      
      def perform
        if @unit.position
          @unit.say "#{R18n.t.explode.collapsing_the_ceiling}"
          @unit.position.floor.units.map do |unit|
            unit.take_damage(100)
          end
        end
      end
      
      def pass_turn
        if @time && @unit.position
          @unit.say "#{R18n.t.explode.is_ticking}"
          @time -= 1
          perform if @time.zero?
        end
      end
    end
  end
end
