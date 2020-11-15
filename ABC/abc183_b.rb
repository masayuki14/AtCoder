# AtCoder Beginner Contest 183
# https://atcoder.jp/contests/abc183/tasks/abc183_b
# B - Billiards
(sx, sy, gx, gy) = gets.chomp.split.map(&:to_f)

dx = sy/(sy + gy) * (gx - sx)

x = sx + dx

puts x
