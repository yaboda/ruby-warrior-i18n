#  -----
# |    S|
# |@> SC|
#  -----

t = R18n.t.towers.intermediate.level_005

description t.description
tip t.tip
clue t.clue

time_bonus 45
ace_score 107
size 5, 2
stairs 1, 1

warrior 0, 1, :east

unit :thick_sludge, 4, 0, :west
unit :thick_sludge, 3, 1, :north
unit :captive, 4, 1, :west
