# AtCoder Grand Contest 033
# A - Darker and Darker
# https://atcoder.jp/contests/agc033/tasks/agc033_a

(h,w) = gets.chomp.split.map(&:to_i)
inf = 10 ** 10
cost = Array.new(h) { Array.new(w, inf) }

mz = []
q = []
h.times do |hidx|
  row = gets.chomp.split('')
  row.each_with_index do |c, widx|
    if c == '#'
      cost[hidx][widx] = 0
      q << [hidx,widx]
    end
  end
  mz << row
end


while ((x, y) = q.shift)

  _cost = cost[x][y]

  if x+1 < h && cost[x+1][y] == inf
    cost[x+1][y] = _cost + 1
    q << [x+1, y]
  end
  if x-1 >= 0 && cost[x-1][y] == inf
    cost[x-1][y] = _cost + 1
    q << [x-1, y]
  end
  if y+1 < w && cost[x][y+1] == inf
    cost[x][y+1] = _cost + 1
    q << [x, y+1]
  end
  if y-1 >= 0 && cost[x][y-1] == inf
    cost[x][y-1] = _cost + 1
    q << [x, y-1]
  end
end

puts cost.flatten.max
