# AtCoder Beginner Contest 176
# C - Step 
# https://atcoder.jp/contests/abc176/tasks/abc176_c
N = gets.chomp.to_i
A = gets.chomp.split.map(&:to_i)

st = Array.new(N) { 0 }
maxh = A[0]

(0...N).each do |i|
  if maxh > A[i]
    st[i] = maxh - A[i]
  else
    maxh = A[i]
    st[i] = 0
  end
end

puts st.reduce(&:+)
