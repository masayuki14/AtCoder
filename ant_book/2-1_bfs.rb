# 迷路の幅優先探索
#
(N, M) = gets.chomp.split.map(&:chomp).map(&:to_i)
@maze = readlines.map{|l| l.chomp.chars}

@sx,@sy,@gx,@gy=nil,nil,nil,nil

INF = 10**10
@distance = Array.new(N) { Array.new(M, INF) }

(0...N).each do |x|
  (0...M).each do |y|
    @sx, @sy = x, y if @maze[x][y] == 's'
    @gx, @gy = x, y if @maze[x][y] == 'g'
  end
end

@que = []

@distance[@sx][@sy] = 0
@que << [@sx,@sy]

def bfs()
  while @que.length > 0
    pp @que
    p = @que.shift
    x,y = p
    break if x == @gx && y == @gy

    # 4方向移動
    [[x+1, y], [x, y+1], [x-1, y], [x, y-1]].each do |np|
      (nx, ny) = np
      if nx >= 0 && nx < N && ny >= 0 && ny < M && @maze[nx][ny] != '#' && @distance[nx][ny] == INF
        @que << [nx, ny]
        @distance[nx][ny] = @distance[x][y] + 1
      end
    end
  end

  @distance[@gx][@gy]
end

pp [bfs, @gx, @gy]

# 10 10
# #s######.#
# ......#..#
# .#.##.##.#
# .#.......
# ##.##.####
# ....#....#
# .#######.#
# ....#.....
# .####.###.
# ....#...g#

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
