# AtCoder Beginner Contest 186
# B - Blocks on Grid
# https://atcoder.jp/contests/abc186/tasks/abc186_b

(H, W) = gets.chomp.split.map(&:to_i)
A = readlines.map{|l| l.chomp.split.map(&:to_i) }

min = A.flatten.min

c = 0

A.each{|a| a.each{|b|
  if b > min
    c += (b - min)
  end
}}

puts c
