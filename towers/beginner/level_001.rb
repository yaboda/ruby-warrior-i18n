#  --------
# |@      >|
#  --------

t = R18n.t.towers.beginner.level_001

description "#{t.description}"
tip "#{t.tip}"


time_bonus 15
ace_score 10
size 8, 1
stairs 7, 0

warrior 0, 0, :east do |u|
  u.add_abilities :walk!
end
