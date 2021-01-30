# AtCoder Beginner Contest 088
# https://atcoder.jp/contests/abc088/tasks/abc088_d
# D - Grid Repainting
(H, W) = gets.chomp.split.map(&:to_i)
maze = readlines.map{ |l| l.chomp.split('') }

#pp maze

gx = H - 1
gy = W - 1
G = 10**9

cost = Array.new(H) { Array.new(W) { nil } }
cost[0][0] = 1

q = [[0, 0]]

while q.length > 0 do
  (x, y) = q.shift

  [[x+1,y], [x-1,y], [x,y+1], [x,y-1]].each do |n|
    (nx, ny) = n
    # goalについた
    if nx == gx && ny == gy && cost[nx][ny].nil?
      cost[nx][ny] = cost[x][y] + 1
      break
    end

    # 次のマスが移動可能で、自分のコストより大きかったら動く
    if nx >= 0 && nx < H && ny >= 0 && ny < W && maze.[](nx)&.[](ny) == '.' && cost[nx][ny].nil?
      cost[nx][ny] = cost[x][y] + 1
      q.push([nx, ny])
    end
  end

  #pp q
  #puts "\e[H\e[2J"
  #cost.each{|l| puts l.map{|c| c == nil ? '*' : c }.join(" ") }
  #sleep 0.1
end



if cost[gx][gy].nil?
  puts -1
else
  white = maze.flatten.reject{|m| m == '#'}.length
  puts white - cost[gx][gy]
end
