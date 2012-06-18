#  -------
# |@  Cww>|
#  -------

t = R18n.t.towers.beginner.level_008

description "#{t.description}"
tip "#{t.tip}"
clue "#{t.clue}"

time_bonus 20
ace_score 46
size 6, 1
stairs 5, 0

warrior 0, 0, :east do |u|
  u.add_abilities :look
  u.add_abilities :shoot!
end

unit :captive, 2, 0, :west
unit :wizard, 3, 0, :west
unit :wizard, 4, 0, :west
