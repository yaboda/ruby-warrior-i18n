#  ------
# |>a S @|
#  ------

t = R18n.t.towers.beginner.level_007

description "#{t.description}"
tip "#{t.tip}"

time_bonus 30
ace_score 50
size 6, 1
stairs 0, 0

warrior 5, 0, :east do |u|
  u.add_abilities :pivot!
end

unit :archer, 1, 0, :east
unit :thick_sludge, 3, 0, :east
