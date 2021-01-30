# AtCoder Beginner Contest 186
# C - Unlucky 7
# https://atcoder.jp/contests/abc186/tasks/abc186_c
N = gets.chomp.to_i

c=0
[*1..N].each do |n|
  next if n.to_s.split('').include?('7') || n.to_s(8).split('').include?('7')
  c+= 1
end

puts c
