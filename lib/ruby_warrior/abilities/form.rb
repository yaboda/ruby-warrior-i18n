module RubyWarrior
  module Abilities
    class Form < Base
      def description
        "#{R18n.t.form.description}"
      end
      
      def perform(direction = :forward, &block)
        verify_direction(direction)
        if space(direction).empty?
          x, y = @unit.position.translate_offset(*offset(direction))
          health = (@unit.health/2.0).floor
          golem = @unit.base_golem
          golem.max_health = health
          golem.turn = block
          @unit.health -= health
          @unit.position.floor.add(golem, x, y, @unit.position.direction)
          @unit.say "#{R18n.t.form.golem_gives_health(direction, health)}"
        else
          @unit.say "#{R18n.t.form.fails}"
        end
      end
    end
  end
end
