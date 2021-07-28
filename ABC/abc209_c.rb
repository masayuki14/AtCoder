# AtCoder Beginner Contest 209
# C - Not Equal
# https://atcoder.jp/contests/abc209/tasks/abc209_c

N = gets.chomp.to_i
C = gets.chomp.split.map(&:to_i)

C.sort!

r = 1
N.times do |i|
  r = r * (C[i] - i) % 1000000007
end

puts r
