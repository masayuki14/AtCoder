# 2次元累積和
#
# 1 1 1 1 1
# 1 1 1 1 1
# 1 1 1 1 1
# 1 1 1 1 1
#
# 素直に累積和
#H = 4
#W = 5
#A = [
#  [1, 1, 1, 1, 1],
#  [1, 1, 1, 1, 1],
#  [1, 1, 1, 1, 1],
#  [1, 1, 1, 1, 1]
#]
#
#s = Array.new(H+1){ Array.new(W+1) { 0 } }
#
#print "\e[H\e[2J"
#(0...H).each do |i|
#  (0...W).each do |j|
#    s[i+1][j+1] = A[i][j] + s[i+1][j] + s[i][j+1] - s[i][j]
#    puts "(%s, %s)" % [i, j]
#    pp s
#    sleep 1
#    print "\e[H\e[2J"
#  end
#end
#
#pp s
#
#return

# AtCoder Beginner Contest 005
# D - おいしいたこ焼きの焼き方
# https://atcoder.jp/contests/abc005/tasks/abc005_4
N = gets.chomp.to_i
d = []
(1..N).each do
  d << gets.chomp.split.map(&:to_i)
end
Q = gets.chomp.to_i
P = readlines.map(&:to_i)

s = Array.new(N+1){ Array.new(N+1){ 0 } }

# 2次元累積和
(0...N).each do |i|
  (0...N).each do |j|
    s[i+1][j+1] = d[i][j] + s[i+1][j] + s[i][j+1] - s[i][j]
  end
end

result = Array.new(N*N+1) { 0 }

(0...N).each do |si|
  (0...N).each do |sj|

    ((si+1)..N).each do |ei|
      ((sj+1)..N).each do |ej|

        place = (ei - si) * (ej - sj)
        result[place] = [result[place], s[ei][ej] - s[si][ej] - s[ei][sj] + s[si][sj]].max

      end
    end

  end
end

(0...Q).each do |x|
  puts result[1, P[x]].max
end
