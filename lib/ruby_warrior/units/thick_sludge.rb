module RubyWarrior
  module Units
    class ThickSludge < Sludge
      def max_health
        24
      end
      
      def character
        "#{R18n.t.thick_sludge.first_letter}"
      end
    end
  end
end
