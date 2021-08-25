# AtCoder Beginner Contest 190
# A - Very Very Primitive Game
# https://atcoder.jp/contests/abc190/tasks/abc190_a
(A, B, C) = gets.chomp.split.map(&:to_i)
if C == 0
  puts A > B ? 'Takahashi' : 'Aoki'
else
  puts B > A ? 'Aoki' : 'Takahashi'
end
