module RubyWarrior
  module Abilities
    class Detonate < Base
      def description
        "#{R18n.t.detonate.description}"
      end
      
      def perform(direction = :forward)
        verify_direction(direction)
        if @unit.position
          @unit.say "#{R18n.t.detonate.bomb_deadly_explosion(direction)}"
          bomb(direction, 1, 0, 8)
          [[1, 1], [1, -1], [2, 0], [0, 0]].each do |x, y|
            bomb(direction, x, y, 4)
          end
        end
      end
      
      def bomb(direction, x, y, damage_amount)
        if @unit.position
          receiver = space(direction, x, y).unit
          if receiver
            if receiver.abilities[:explode!]
              receiver.say "#{R18n.t.detonate.ticking_explosive}"
              receiver.abilities[:explode!].perform
            else
              damage(receiver, damage_amount)
            end
          end
        end
      end
    end
  end
end
