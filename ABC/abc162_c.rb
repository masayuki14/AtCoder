# AtCoder Beginner Contest 162
# C - Sum of gcd of Tuples (Easy)
# https://atcoder.jp/contests/abc162/tasks/abc162_c
K = gets.chomp.to_i

s = 0
(1..K).each do |x|
  (1..K).each do |y|
    (1..K).each do |z|
      s += x.gcd(y).gcd(z)
    end
  end
end

puts s
