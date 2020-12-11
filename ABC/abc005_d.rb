# 2次元累積和
#
# 1 1 1 1 1
# 1 1 1 1 1
# 1 1 1 1 1
# 1 1 1 1 1
#
# をゼータ変換で累積和をだす

# H, W = 4, 5
# A = [
#   [1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1]
# ]
# 
# s = Array.new(H){ Array.new(W) { 0 } }
# (0...H).each do |i|
#   (0...W).each do |j|
#     if i == 0
#       s[i][j] = A[i][j]
#     else
#       s[i][j] = s[i-1][j] + A[i][j]
#     end
#   end
# end
# 
# (0...H).each do |i|
#   (0...W).each do |j|
#     if j == 0
#       s[i][j] += 0
#     else
#       s[i][j] += s[i][j-1]
#     end
#   end
# end
#
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

s = Array.new(N){ Array.new(N){ 0 } }

# ゼータ変換で2次元累積和
(0...N).each do |i|
  (0...N).each do |j|
    if i == 0
      s[i][j] = d[i][j]
    else
      s[i][j] = s[i-1][j] + d[i][j]
    end
  end
end
(0...N).each do |i|
  (0...N).each do |j|
    if j > 0
      s[i][j] += s[i][j-1]
    end
  end
end

result = Array.new((N+1)*(N+1)) { 0 }

# 探索範囲のマスの数はP[x]以下
(0...N).each do |si|
  (0...N).each do |sj|

    (si...N).each do |ei|
      (sj...N).each do |ej|

        place = (ei - (si-1)) * (ej - (sj-1))
        #pp [si, sj, ei, ej, place, P[x] ]

        dij = s[ei][ej]
        dij -= s[si-1][ej] if si > 0
        dij -= s[ei][sj-1] if sj > 0
        dij += s[si-1][sj-1] if si > 0 && sj > 0

        result[place] = [result[place], dij].max
      end
    end

  end
end

(0...Q).each do |x|
  puts result[1,P[x]].max
end


# ゼータ変換で累積和を求めるのはかんたんだけど、
# その後利用するときの計算で (0,0) とかの部分で -1 のことを考えるのは結構面倒
#
# 一方
# s[x+1][y+1]= s[x][y+1] + s[x+1][y] − s[x][y] + a[x][y]
# で累積和を求めるとちょっとややこしいのだけど
# その後の利用ではこっちのほうが楽だった。
#
# 慣れていこう
