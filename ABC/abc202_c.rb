# AtCoder Beginner Contest 202
# C - Made Up
# https://atcoder.jp/contests/abc202/tasks/abc202_c
N = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)
B = gets.chomp.split.map(&:to_i)
C = gets.chomp.split.map(&:to_i)

D = [*0...N].map{|j| B[C[j]-1]}.sort

#p A
#p D

a = A.group_by{|i| i}
d = D.group_by{|i| i}

cnt = 0
a.each do |i, ar|
  cnt += ar.length * (d[i].nil? ? 0 : d[i].length)
end

puts cnt
