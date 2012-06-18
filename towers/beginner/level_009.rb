#  -----------
# |>Ca  @ S wC|
#  -----------

t = R18n.t.towers.beginner.level_009

description "#{t.description}"
tip "#{t.tip}"
clue "#{t.clue}"

time_bonus 40
ace_score 100
size 11, 1
stairs 0, 0

warrior 5, 0, :east

unit :captive, 1, 0, :east
unit :archer, 2, 0, :east
unit :thick_sludge, 7, 0, :west
unit :wizard, 9, 0, :west
unit :captive, 10, 0, :west
