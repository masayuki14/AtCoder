# AtCoder Beginner Contest 209
# A - Counting 
# https://atcoder.jp/contests/abc209/tasks/abc209_a
(A, B) = gets.chomp.split.map(&:to_i)

 if A > B
   puts 0
   return
 end

puts B - A + 1

