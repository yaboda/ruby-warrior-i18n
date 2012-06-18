#  ----
# |C s |
# | @ S|
# |C s>|
#  ----

t = R18n.t.towers.intermediate.level_004

description t.description
tip t.tip
clue t.clue

time_bonus 55
ace_score 144
size 4, 3
stairs 3, 2

warrior 1, 1, :east do |u|
  u.add_abilities :listen, :direction_of
end

unit :captive, 0, 0, :east
unit :captive, 0, 2, :east
unit :sludge, 2, 0, :south
unit :thick_sludge, 3, 1, :west
unit :sludge, 2, 2, :north
