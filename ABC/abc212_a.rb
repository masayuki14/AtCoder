# AtCoder Beginner Contest 212
# A - Alloy
# https://atcoder.jp/contests/abc212/tasks/abc212_a
(A, B) = gets.chomp.split.map(&:to_i)
if 0 < A && B == 0
  puts 'Gold'
elsif A == 0 && 0 < B
  puts 'Silver'
else
  puts 'Alloy'
end
