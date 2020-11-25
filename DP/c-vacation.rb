# C - Vacation
# https://atcoder.jp/contests/dp/tasks/dp_c
#
N = gets.chomp.to_i
a, b, c = [], [], []
readlines.each{|l| 
  abc = l.split.map(&:to_i)
  a << abc[0]
  b << abc[1]
  c << abc[2]
}

dp = Array.new(N) { Array.new(3) { 0 } }

(0...N).each do |i|

  if i == 0
    dp[i][0] = a[i]
    dp[i][1] = b[i]
    dp[i][2] = c[i]
    next
  end

  dp[i][0] = a[i] + [dp[i-1][1], dp[i-1][2]].max
  dp[i][1] = b[i] + [dp[i-1][0], dp[i-1][2]].max
  dp[i][2] = c[i] + [dp[i-1][0], dp[i-1][1]].max

end

puts dp[N-1].max
