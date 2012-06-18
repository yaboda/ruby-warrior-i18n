#  ----
# |@s  |
# | sS>|
#  ----

t = R18n.t.towers.intermediate.level_002

description t.description
tip t.tip
clue t.clue

time_bonus 40
ace_score 84
size 4, 2
stairs 3, 1

warrior 0, 0, :east do |u|
  u.add_abilities :attack!, :health, :rest!
end
unit :sludge, 1, 0, :west
unit :thick_sludge, 2, 1, :west
unit :sludge, 1, 1, :north
