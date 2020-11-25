# AtCoder Beginner Contest 183
# https://atcoder.jp/contests/abc183/tasks/abc183_c
# C - Travel
(N, K) = gets.chomp.split.map(&:to_i)
T = readlines.map{|l| l.chomp.split.map(&:to_i) }

perm = [*1..(N-1)].permutation(N-1).to_a

cnt = 0
perm.each do |p|
  cost = 0
  i = 0
  p.each do |dj|
    j = dj
    cost += T[i][j]
    i = j
  end
  cost += T[i][0]

  cnt += 1 if cost == K
end

puts cnt
