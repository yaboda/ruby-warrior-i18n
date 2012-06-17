module RubyWarrior
  module Abilities
    class Rest < Base
      def description
        "#{R18n.t.rest.description}"
      end
      
      def perform
        if @unit.health < @unit.max_health
          amount = (@unit.max_health*0.1).round
          amount = @unit.max_health-@unit.health if (@unit.health + amount) > @unit.max_health
          @unit.health += amount
          @unit.say "#{R18n.t.rest.receives_health(amount, @unit.health)}"
        else
          @unit.say "#{R18n.t.rest.fit_fiddle}"
        end
      end
    end
  end
end
