# AtCoder Beginner Contest 162
# D - RGB Triplets
# https://atcoder.jp/contests/abc162/tasks/abc162_d
N = gets.chomp.to_i
S = gets.chomp

cnt = 0
(0..(N-3)).each do |i|
  ((i+1)..(N-2)).each do |j|

    next if S[i] == S[j]
    k = S[j+1, N]
    if k.length >= j-i-1
      k[j-i-1] = S[i]
    end

    k = k.gsub(/#{S[i]}/,'').gsub(/#{S[j]}/, '')

    #puts sprintf('%s %s: %s: %s %s', i, j, k, N-1, 2*j - i)


    cnt += k.length

    #((j+1)..(N-1)).each do |k|
    #  next if S[k] != k_mem
    #  next if j - i == k - j
    #  #if 2*j - i == k

    #  #puts sprintf('%s %s %s: %s %s %s', i, j, k, S[i], S[j], S[k])
    #  cnt += 1
    #end
  end
end

puts cnt
