# AtCoder Grand Contest 023
# A - Zero-Sum Ranges
# https://atcoder.jp/contests/agc023/tasks/agc023_a

N = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)

s = Array.new(N){ 0 }

(0...N).each do |i|
  if i==0
    s[i] = A[i]
  else
    s[i] = s[i-1] + A[i]
  end
end

#pp s

dict = Hash.new(0)
s.each do |v|
  dict[v] += 1
end


#pp dict

count = 0
dict.each do |k, v|
  count += v * (v -1) / 2
end

puts count + dict[0]
