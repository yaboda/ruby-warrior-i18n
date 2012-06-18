#  --------
# |C @ S aa|
#  --------

t = R18n.t.towers.beginner.level_006

description "#{t.description}"
tip "#{t.tip}"
clue "#{t.clue}"

time_bonus 55
ace_score 105
size 8, 1
stairs 7, 0

warrior 2, 0, :east

unit :captive, 0, 0, :east
unit :thick_sludge, 4, 0, :west
unit :archer, 6, 0, :west
unit :archer, 7, 0, :west
