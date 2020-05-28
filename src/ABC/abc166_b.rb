# AtCoder Beginner Contest 166
# 
# https://atcoder.jp/contests/abc166/tasks/abc166_b
(N, K) = gets.chomp.split.map(&:to_i)
d = []
a = []
(1..K).each do |i|
  d << gets.chomp.to_i
  a << gets.chomp.split.map(&:to_i)
end

puts N - a.flatten.uniq.length
