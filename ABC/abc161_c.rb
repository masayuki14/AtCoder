# AtCoder Beginner Contest 161
# https://atcoder.jp/contests/abc161/tasks/abc161_c
# C - Replacing Integer
(N, K) = gets.chomp.split.map(&:to_i)

if N == 0 || K == 1
  puts 0
  exit
end

mod = N % K

puts mod > (mod - K).abs ? (mod - K).abs : mod
