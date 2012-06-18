#  --------
# |@   s  >|
#  --------
t = R18n.t.towers.beginner.level_002

description "#{t.description}"
tip "#{t.tip}"
clue "#{t.clue}"

time_bonus 20
ace_score 26
size 8, 1
stairs 7, 0

warrior 0, 0, :east do |u|
  u.add_abilities :feel, :attack!
end

unit :sludge, 4, 0, :west
