#  -------
# |@ Sa S>|
#  -------

t = R18n.t.towers.beginner.level_004

description "#{t.description}"
tip "#{t.tip}"
clue "#{t.clue}"

time_bonus 45
ace_score 90
size 7, 1
stairs 6, 0

warrior 0, 0, :east

unit :thick_sludge, 2, 0, :west
unit :archer, 3, 0, :west
unit :thick_sludge, 5, 0, :west
