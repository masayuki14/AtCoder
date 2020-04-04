# AtCoder Beginner Contest 161
# https://atcoder.jp/contests/abc161/tasks/abc161_b
# B - Popular Vote
(N, M) = gets.chomp.split.map(&:to_i)
@a = gets.chomp.split.map(&:to_i)

limit = (@a.reduce(0, &:+) / (4 * M).to_f)
s = @a.delete_if {|a| a < limit } . length

puts s >= M ? 'Yes' : 'No'
