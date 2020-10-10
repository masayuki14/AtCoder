# HHKB プログラミングコンテスト 2020
# B - Futon
# https://atcoder.jp/contests/hhkb2020/tasks/hhkb2020_b

(H,W) = gets.chomp.split.map(&:to_i)
S = readlines.map{|l| l.chomp.split('')}

c = 0

(0...H).each do |i|
  (0...W).each do |j|
    next if S[i][j] == '#'

    c += 1 if i < (H-1) && S[i+1][j] == '.'
    c += 1 if j < (W-1) && S[i][j+1] == '.'

  end
end

puts c
