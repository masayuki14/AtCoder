# AtCoder Beginner Contest 208
# C - Fair Candy Distribution
# https://atcoder.jp/contests/abc208/tasks/abc208_c
(N, K) = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

base = K/N
mod = K%N

sh = mod == 0 ? 0 : A.sort[mod]

A.each do |v|
  puts v < sh ? base + 1 : base
end

