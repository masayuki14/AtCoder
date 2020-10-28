# AtCoder Beginner Contest 122
# C - GeT AC
# https://atcoder.jp/contests/abc122/tasks/abc122_c
(N, Q) = gets.chomp.split.map(&:to_i)
S = gets.chomp
LR = readlines.map { |line| line.chomp.split.map(&:to_i) }
#p [N, Q, S]

sum  = Array.new(N+1, 0)
sum[0] = 0
sum[1] = 0

(2..N).each do |i|
  sum[i] = sum[i-1] + (S[i-2] == 'A' && S[i-1] == 'C' ? 1 : 0)
end

#p sum[1..N]

LR.each do |lr|
  l = lr[0]
  r = lr[1]
  s = sum[r] - sum[l]
  #s2 = like[lr[0]..lr[1]].reduce(:+)

  #p [l, r, sum[l], sum[r-1], s, s2]
  p s
end
