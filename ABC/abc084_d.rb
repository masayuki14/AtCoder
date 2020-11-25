# AtCoder Beginner Contest 084
# D - 2017-like Number
# https://atcoder.jp/contests/abc084/tasks/abc084_d
require 'prime'
class Integer
  def prime?
    Prime.prime?(self)
  end
end

Q = gets.chomp.to_i
LR = readlines.map { |line| line.chomp.split.map(&:to_i) }

min = LR.flatten.min
max = LR.flatten.max


# 累積和をつくる
#like = Array.new(max+1, 0)
sum  = Array.new(max+1, 0)
(min..max).each do |n|
  #like[n] = n.prime? && ((n+1)/2).prime? ? 1 : 0
  sum[n] = sum[n-1] + (n.prime? && ((n+1)/2).prime? ? 1 : 0)
end

#p sum

LR.each do |lr|
  l = lr[0]
  r = lr[1]
  s = sum[r] - sum[l-1]
  #s2 = like[lr[0]..lr[1]].reduce(:+)

  #p [l, r, sum[l], sum[r-1], s, s2]
  p s
end
