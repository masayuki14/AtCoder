# AtCoder Beginner Contest 177
# https://atcoder.jp/contests/abc161/tasks/abc177_c
# C - Traveling Salesman around Lake
N = gets.chomp.to_i
A = gets.split.map(&:to_i)
mod = 10**9+7

# i+1 - N-1 までの累積和を計算
sum=0
(1...N).each do |i|
  sum += A[i]
end

r = 0
(0...N-1).each do |i|
  r += A[i] * sum
  sum -= A[i+1] #  累積和を減らす
end

puts  r % mod
