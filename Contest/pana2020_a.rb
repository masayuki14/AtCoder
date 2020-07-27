# パナソニックプログラミングコンテスト2020
# A - Kth Term
# https://atcoder.jp/contests/panasonic2020/tasks/panasonic2020_a
a = %w|1 1 1 2 1 2 1 5 2 2 1 5 1 2 1 14 1 5 1 5 2 2 1 15 2 2 5 4 1 4 1 51|.map(&:to_i)
k = gets.to_i

puts a[k-1]
