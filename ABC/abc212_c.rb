# AtCoder Beginner Contest 212
# C - Min Difference
# https://atcoder.jp/contests/abc212/tasks/abc212_c
(N, M) = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i).sort
B = gets.chomp.split.map(&:to_i).sort

i = 0
j = 0
min = (A[i]-B[j]).abs

while (i < A.length) && (j < B.length) do
  min = [min, (A[i]-B[j]).abs].min

  if A[i] < B[j]
    i += 1
  else
    j += 1
  end
end

puts min
