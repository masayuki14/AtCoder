# AtCoder Beginner Contest 160
# https://atcoder.jp/contests/abc161/tasks/abc160_c
# C - Traveling Salesman around Lake
(@k, @n) = gets.split.map(&:to_i)
@a = gets.split.map(&:to_i)

terms = [@a[0]]

(1...(@a.length)).each do |i|
  terms << @a[i] - @a[i-1]
end

terms = terms + [@k - @a[-1] + @a[0]]
pp @k - terms.max
