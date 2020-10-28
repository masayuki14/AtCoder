# HHKB プログラミングコンテスト 2020
# E - Lamps
# https://atcoder.jp/contests/hhkb2020/tasks/hhkb2020_e

(H,W) = gets.chomp.split.map(&:to_i)
S = readlines.map{|l| l.chomp.split('')}


def count(i, j)
  c = 0
  return 0 if S[i][j] == '#'

  c += 1

  ii = 1
  while i + ii <= (H-1)
    if S[i+ii][j] == '.'
      c += 1
    else
      break
    end
    ii += 1
  end

  di = 1
  while i - di >= 0
    if S[i-di][j] == '.'
      c += 1
    else
      break
    end
    di += 1
  end

  ij = 1
  while j + ij <= (W-1)
    if S[i][j+ij] == '.'
      c += 1
    else
      break
    end
    ij += 1
  end

  dj = 1
  while j - dj >= 0
    if S[i][j-dj] == '.'
      c += 1
    else
      break
    end
    dj += 1
  end

  return c
end


def dd_count(bit)
  bit_ar = bit.split('')
  bit_i = 0
  c = 0
  (0...H).each do |i|
    (0...W).each do |j|
      next if S[i][j] == '#'
      if bit_ar[bit_i] == '1'
        c += count(i, j)
        bit_i += 1
      end
      return c if bit_i == bit_ar.length
    end
  end

  return c
end


dot=0
(0...H).each do |i|
  dot += S[i].reject{|s| s=='#'}.length
end

result = 0
[*(1..(2**dot))].map{|s|s.to_s(2)}.each do |bit|
  pp bit.reverse
  result += dd_count(bit.reverse)
end

puts result
