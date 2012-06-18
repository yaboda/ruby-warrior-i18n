#  -----
# | sC >|
# |@ s C|
# | s   |
#  -----

t = R18n.t.towers.intermediate.level_007

description t.description
tip t.tip
clue t.clue

time_bonus 70
ace_score 134
size 5, 3
stairs 4, 0

warrior 0, 1, :east

unit :sludge, 1, 0, :south
unit :sludge, 1, 2, :north
unit :sludge, 2, 1, :west
unit :captive, 4, 1, :west do |u|
  u.add_abilities :explode!
  u.abilities[:explode!].time = 10
end
unit :captive, 2, 0, :west
