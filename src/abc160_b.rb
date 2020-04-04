# AtCoder Beginner Contest 160
# https://atcoder.jp/contests/abc161/tasks/abc160_b
# B - Golden Coins
x = gets.chomp.to_i

a = x / 500
u = a * 1000
a = (x - a*500 ) / 5
u += a * 5

puts u
