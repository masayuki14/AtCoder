# AtCoder Beginner Contest 212
# B - Weak Password
# https://atcoder.jp/contests/abc212/tasks/abc212_b
(a,b,c,d) = gets.chomp.split('').map(&:to_i)

if a==b && b==c && c==d
  puts 'Weak'
elsif (a+1)%10 == b && (b+1)%10 == c && (c+1)%10 == d
  puts 'Weak'
else
  puts 'Strong'
end
