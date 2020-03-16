# パナソニックプログラミングコンテスト2020
# C - Sqrt Inequality
# https://atcoder.jp/contests/panasonic2020/tasks/panasonic2020_c
(A, B, C) = gets.split.map(&:to_i)

#if Math.sqrt(A*B).to_d < (C - A - B) / 2.to_d
#if Math.sqrt(A) + Math.sqrt(B) < Math.sqrt(C)
d = C-A-B
if d > 0 && 4*A*B < (d)**2
  puts 'Yes'
else
  puts 'No'
end
