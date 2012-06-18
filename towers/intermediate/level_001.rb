#  ------
# |      |
# |@     |
# |      |
# |  >   |
#  ------

t = R18n.t.towers.intermediate.level_001

description t.description
tip t.tip

time_bonus 20
ace_score 19
size 6, 4
stairs 2, 3

warrior 0, 1, :east do |u|
  u.add_abilities :walk!, :feel, :direction_of_stairs
end
