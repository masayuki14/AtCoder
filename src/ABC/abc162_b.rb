# AtCoder Beginner Contest 162
# B - FizzBuzz Sum
# https://atcoder.jp/contests/abc162/tasks/abc162_b
N = gets.chomp.to_i

puts [*1..N].map{|n| n%3 ==0 || n%5 ==0 ? 0 : n}.inject(0,:+)
