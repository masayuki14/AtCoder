# AtCoder Beginner Contest 190
# C - Bowls and Dishes
# https://atcoder.jp/contests/abc190/tasks/abc190_c
(N, M) = gets.chomp.split.map(&:to_i)
AB = []
M.times do
  AB << gets.chomp.split.map(&:to_i)
end
K = gets.chomp.to_i
CD = []
K.times do
  CD << gets.chomp.split.map(&:to_i)
end

max_cond = 0

# bit全探索するための2進数
[*(0...(2**K))].map{|n| sprintf("%0#{K}b", n)}.each do |bin|
  clear_cond = 0
  # 玉が乗ってる皿
  dishes = []
  bin.split('').each_with_index do |bit, index|
    dishes << CD[index][bit.to_i]
  end

  AB.each do |condition|
    clear_cond += 1 if dishes.include?(condition[0]) && dishes.include?(condition[1])
  end

  max_cond = clear_cond if clear_cond > max_cond
end

puts max_cond
