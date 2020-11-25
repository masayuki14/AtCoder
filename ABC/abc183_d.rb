# AtCoder Beginner Contest 183
# https://atcoder.jp/contests/abc183/tasks/abc183_d
# D - Water Heater

# https://imoz.jp/algorithms/imos_method.html
# いもす法でうまくいった。累積和の勝利。
(N, W) = gets.chomp.split.map(&:to_i)
STP = readlines.map{|l| l.chomp.split.map(&:to_i) }

pool = Array.new(STP.map{|x| x[1]}.max + 1) { 0 }


STP.each do |stp|
  (s, t, p) = stp
  pool[s] += p
  pool[t] -= p
end

#pp pool

(1...(pool.length)).each do |i|
  pool[i] += pool[i-1]
end

#pp pool

puts W >= pool.max ? 'Yes' : 'No'
