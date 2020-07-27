# https://atcoder.jp/contests/atc001/tasks/dfs_a
# A - 深さ優先探索
#
def view()
  print "\e[H\e[2J" # 画面クリア
  @a.each {|s| puts s.join}
  sleep(0.05)
end

ENV[Z='RUBY_THREAD_VM_STACK_SIZE']||exec({Z=>'100000000'},'ruby',$0)
(N, M) = gets.chomp.split.map(&:chomp).map(&:to_i)
@a = readlines.map{|l| l.chomp.chars}
@reached = Array.new(N) { Array.new(M, false) }


#def reach_goal?(x, y)
#  #view()
#  dx = [ 0, 1, -1, 0]
#  dy = [-1, 0,  0, 1]
#
#  (0..3).each do |i|
#    nx = x + dx[i]
#    ny = y + dy[i]
#
#    next unless nx >= 0 && nx < ::N && ny >= 0 && ny < ::M
#    return true if @a[nx][ny] == 'g'
#    next if @a[nx][ny] == '#'
#    next if @reached[nx][ny]
#    @reached[nx][ny] = true
#    return true if reach_goal?(nx, ny)
#  end
#
#  return false
#end
#
#result = false
#
#(0...N).each do |x|
#  (0...M).each do |y|
#    if @a[x][y] == 's'
#      result = reach_goal?(x, y)
#      break
#    end
#  end
#end
#puts result ? 'Yes' : 'No'

def search(x, y)
  return false unless x >= 0 && x < ::N && y >= 0 && y < ::M
  return false if @a[x][y] == '#'

  return true if @a[x][y] == 'g'

  @a[x][y] = '#'

  return true if search(x+1, y)
  return true if search(x, y+1)
  return true if search(x-1, y)
  return true if search(x, y-1)
  false
end

result = false

(0...N).each do |x|
  (0...M).each do |y|
    if @a[x][y] == 's'
      result = search(x, y)
      break
    end
  end
end

puts result ? 'Yes' : 'No'

# 15 25
# .......#.....###....#....
# ..####.#...#......#.#.#..
# .#.....#..#.#####.#...#.#
# ....##....#.#.....##..#.#
# .#...##...#.#..##..#.....
# .#..#..#.#....#.#..#.####
# .##.#..#..####..#....#.#.
# .#..#...#.#.s....###.#...
# .#.#..#..#.....#..#..#.#.
# .###..#...#.####..#.#..#.
# .#.......#..#..#..#..#.#.
# .#.#..####..#.....#.#..#.
# .#.#.....#..#..#..#...#g.
# .#.#........#..#...###.#.
# ...#..####.....#.......#.
#
