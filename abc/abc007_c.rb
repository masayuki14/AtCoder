# AtCoder Beginner Contest 007
# C - 幅優先探索
# https://atcoder.jp/contests/abc007/tasks/abc007_3

(r,c) = gets.chomp.split.map(&:to_i)
(sx,sy) = gets.chomp.split.map(&:to_i)
(gx,gy) = gets.chomp.split.map(&:to_i)

mz = []
r.times do |_|
  mz << gets.chomp.split('')
end

inf = 10 ** 10
cost = Array.new(r) { Array.new(c, inf) }
cost[sx-1][sy-1] = 0

q = [[sx-1, sy-1]]

while q.size > 0
  (x, y) = q.shift

  # goal
  if x == gx-1 && y == gy-1
    break
  end

  _cost = cost[x][y]

  if x+1 < r && mz[x+1][y] == '.' && cost[x+1][y] == inf
    cost[x+1][y] = _cost + 1
    q << [x+1, y]
  end
  if x-1 >= 0 && mz[x-1][y] == '.' && cost[x-1][y] == inf
    cost[x-1][y] = _cost + 1
    q << [x-1, y]
  end
  if y+1 < c && mz[x][y+1] == '.' && cost[x][y+1] == inf
    cost[x][y+1] = _cost + 1
    q << [x, y+1]
  end
  if y-1 >= 0 && mz[x][y-1] == '.' && cost[x][y-1] == inf
    cost[x][y-1] = _cost + 1
    q << [x, y-1]
  end
end

puts cost[gx-1][gy-1]
