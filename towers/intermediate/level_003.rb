#  ---
# |>s |
# |s@s|
# | C |
#  ---

t = R18n.t.towers.intermediate.level_003

description t.description
tip t.tip
clue t.clue

time_bonus 50
ace_score 101
size 3, 3
stairs 0, 0

warrior 1, 1, :east do |u|
  u.add_abilities :rescue!, :bind!
end

unit :sludge, 1, 0, :west
unit :captive, 1, 2, :west
unit :sludge, 0, 1, :west
unit :sludge, 2, 1, :west
