# HHKB プログラミングコンテスト 2020
# C - Neq Min
# https://atcoder.jp/contests/hhkb2020/tasks/hhkb2020_c

N = gets.chomp.to_i
P = gets.chomp.split.map(&:to_i)

memo = Array.new(300000, true)
min = 0

j = 0
(0...N).each do |i|
  memo[P[i]] = false

  #  if !memo[min]
  #    while !memo[j] && j<=200000
  #      j += 1
  #    end
  #    min = j
  #  end

  unless memo[j]
    while true
      j+=1
      break if memo[j]
    end
  end

  puts j
end
