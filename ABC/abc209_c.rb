
N = gets.chomp.to_i
C = gets.chomp.split.map(&:to_i)

C.sort!

r = 1
N.times do |i|
  r = r * (C[i] - i) % 1000000007
end

puts r
