# パナソニックプログラミングコンテスト2020
# B - Bishop
# https://atcoder.jp/contests/panasonic2020/tasks/panasonic2020_b
(H, W) = gets.split.map(&:to_i)

if H == 1 || W == 1
  puts 1
else
  if H*W % 2 == 0
    puts H*W/2
  else
    puts H*W/2 + 1
  end
end
