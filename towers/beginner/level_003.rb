#  ---------
# |@ s ss s>|
#  ---------

t = R18n.t.towers.beginner.level_003

description "#{t.description}"
tip "#{t.tip}"
clue "#{t.clue}"

time_bonus 35
ace_score 71
size 9, 1
stairs 8, 0

warrior 0, 0, :east do |u|
  u.add_abilities :health, :rest!
end

unit :sludge, 2, 0, :west
unit :sludge, 4, 0, :west
unit :sludge, 5, 0, :west
unit :sludge, 7, 0, :west
