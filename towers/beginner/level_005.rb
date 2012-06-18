#  -------
# |@ CaaSC|
#  -------

t = R18n.t.towers.beginner.level_005

description "#{t.description}"
tip "#{t.tip}"
clue "#{t.clue}"

time_bonus 45
ace_score 123
size 7, 1
stairs 6, 0

warrior 0, 0, :east do |u|
  u.add_abilities :rescue!
end

unit :captive, 2, 0, :west
unit :archer, 3, 0, :west
unit :archer, 4, 0, :west
unit :thick_sludge, 5, 0, :west
unit :captive, 6, 0, :west
