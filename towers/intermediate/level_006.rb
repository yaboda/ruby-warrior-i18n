#  ------
# |Cs   >|
# |@  sC |
#  ------

t = R18n.t.towers.intermediate.level_006

description t.description
tip t.tip
clue t.clue

time_bonus 50
ace_score 108
size 6, 2
stairs 5, 0

warrior 0, 1, :east

unit :sludge, 1, 0, :west
unit :sludge, 3, 1, :west
unit :captive, 0, 0, :west
unit :captive, 4, 1, :west do |u|
  u.add_abilities :explode!
  u.abilities[:explode!].time = 7
end
