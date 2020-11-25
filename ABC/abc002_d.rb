# AtCoder Beginner Contest 002
# D - 派閥
# https://atcoder.jp/contests/abc002/tasks/abc002_4
#
# 解説を読んだ
# https://www.slideshare.net/chokudai/abc002
#
# Rubyの提出例
# https://atcoder.jp/contests/abc002/submissions/111299
# 正直読めない。

(N,M) = gets.chomp.split.map(&:to_i)
XY = readlines.map{|line| line.split.map(&:to_i)}

known = Hash.new{[]}

XY.each do |a|
  (x,y) = a
  known[x] <<= y
  known[y] <<= x
end

# N人に対して単純に全探索すれば良い
# 考えられるすべての組み合わせ
all_pattern = []
[*1..N].each{|v| all_pattern += [*1..N].combination(v).to_a }

max = 1
all_pattern.each do |g|
  # 派閥の組み合わせが全部 known にあれば成立する派閥である
  if g.combination(2).all?{ |x,y| known[x].include?(y) }
    max = g.length
  end
end

puts max

