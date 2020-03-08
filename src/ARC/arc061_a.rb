# AtCoder Regular Contest 061
# C - たくさんの数式
# https://atcoder.jp/contests/arc061/tasks/arc061_a
S = gets.chomp
L = S.length

# + の挿入位置のパターンを2進数で表す
positions = (0...(2**(L-1))).map{|i| i.to_s(2)}
sum = []

positions.each do |p|
  p = sprintf("%0#{L-1}d", p.to_i)
  start = 0
  length = 1
  p.chars.each_with_index do |f, index|
    if f == '1'
      pp sum << S[start, length].to_i
      start += length
      length = 1
    else
      length += 1
    end
  end
  pp sum << S[start, length].to_i
end

puts sum.reduce(:+)

# 12345
# 1 2345
# 1 2 345
# 1 23 45
# 1 234 5
# 1 2 3 45
# 1 2 34 5
# 1 2 3 4 5
#
# 8 - 1 : 5keta, 4kasho, 1banme, 2**(5 -1 -1) -1
#
# 12 345
# 12 3 45
# 12 34 5
#
# 4 -1 : 5keta 4kasho, 2banme, 2**(5 -1 -2) -1
#
# 123 45
# 123 4 5
#
# 1234 5
