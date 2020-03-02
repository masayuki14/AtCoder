# Lake Counting
# http://poj.org/problem?id=2386
#
# W........WW.
# .WWW.....WWW
# ....WW...WW.
# .........WW.
# .........W..
# ..W......W..
# .W.W.....WW.
# W.W.W.....W.
# .W.W......W.
# ..W.......W.
#
# W........WW.W....W..W..WW......W..W..WW....
# .WWW.W.......W...W...WW........W...WW......
# ....W.WW.....W...W.......W.....W.......W...
# .............WW..W....W........W....W......
# ....W...W.....W..WW..W..W......WW..W..W....
# ..W...........W..W..WW.....W....W..........
# .W.W...W......W...WW.......WW..W.....W.W...
# W.W...W.......W.......W.....W.W.W...W......
# .W.W...WW.....W....W........W..W...W.W.....
# ..W...........WW.....W......W..WWW.WW...WW.
# W.......W.W...................WW....W.....W
# .WW.....W..WW..........W....W.WW.....WW.WW.
# ........WW.........W..W....W.....W........W
# ...W.....W...W.....W.W.W..W.W...W...WW...WW
# .........W.........W..W....W....W.W.W...W..
# ..W......W..W......W...WW...WW..W..W..W....
# ..W..W.....W.........W.....................

@a = "W........WW.
     .WWW.....WWW
     ....WW...WW.
     .........WW.
     .........W..
     ..W......W..
     .W.W.....WW.
     W.W.W.....W.
     .W.W......W.
     ..W.......W.".split.map{|s| s.chars}

@a = readlines.map{|l| l.chomp.chars}

def view(lakes)
  print "\e[H\e[2J" # 画面クリア
  lakes.each {|s| puts s.join}
end

N = @a.length
M = @a[0].length

def fill_lake(x, y)

  @a[x][y] = '.'
  view(@a)
  sleep(0.05)

  (-1..1).each do |i|
    (-1..1).each do |j|
      dx = x + i
      dy = y + j

      if dx >= 0 && dx < N && dy >= 0 && dy < M
        fill_lake(dx, dy) if @a[dx][dy] == 'W'
      end
    end
  end
end

view(@a)
sleep(0.1)

count = 0
(0...N).each do |x|
  (0...M).each do |y|
    if @a[x][y] == 'W'
      fill_lake(x, y)
      count += 1
    end
  end
end

puts count
