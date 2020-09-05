# C - Vacation
# https://atcoder.jp/contests/dp/tasks/dp_c

N = gets.chomp.to_i
L = readlines.map { |l| l.split.map(&:to_i) }
A = L.map{|l| l[0]}
B = L.map{|l| l[1]}
C = L.map{|l| l[2]}

p [N, L, A, B, C]

dp = Array.new(N, 0)
