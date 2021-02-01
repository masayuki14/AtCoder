# AtCoder Beginner Contest 190
# B - Magic 3
# https://atcoder.jp/contests/abc186/tasks/abc190_b
(N, S, D) = gets.chomp.split.map(&:to_i)
XY = readlines.map{ |l| l.chomp.split.map(&:to_i) }

XY.each do |m|
  (x, y) = m
  if x < S && y > D
    puts 'Yes'
    return
  end
end

puts 'No'
