#  -------
# |@ Ss C>|
#  -------

t = R18n.t.towers.intermediate.level_008

description t.description
tip t.tip
clue t.clue

time_bonus 30
size 7, 1
stairs 6, 0

warrior 0, 0, :east do |u|
  u.add_abilities :look
  u.add_abilities :detonate!
end

unit :captive, 5, 0, :west do |u|
  u.add_abilities :explode!
  u.abilities[:explode!].time = 9
end
unit :thick_sludge, 2, 0, :west
unit :sludge, 3, 0, :west
