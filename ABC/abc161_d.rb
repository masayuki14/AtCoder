# AtCoder Beginner Contest 161
# https://atcoder.jp/contests/abc161/tasks/abc161_d
# D - Lunlun Number

K = gets.chomp.to_i

a = %w|0 1 2 3 4 5 6 7 8 9|

lun_s = '0'
digit = 1

(0...10**5).each do |i|

  if a[i][0].to_i-1 >= 0
    a << (a[i][0].to_i-1).to_s + a[i]
  end

  if a[i][0].to_i >= 0
    a << (a[i][0].to_i).to_s + a[i]
  end

  if a[i][0].to_i+1 < 10
    a << (a[i][0].to_i+1).to_s + a[i]
  end

  break if i == K
end

puts (a.map(&:to_i).uniq.sort)[K]

