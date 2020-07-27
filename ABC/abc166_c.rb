# AtCoder Beginner Contest 166
# 
# https://atcoder.jp/contests/abc166/tasks/abc166_c

(N, M) = gets.chomp.split.map(&:to_i)
H = gets.chomp.split.map(&:to_i)
AB = readlines.map{ |l| l.chomp.split.map(&:to_i) }

routes = Hash.new{|h,k| h[k] = []}
AB.each do |a|
  routes[a[0]] << a[1]
  routes[a[1]] << a[0]
end

routes.each_key {|k| routes[k] = routes[k].uniq}

cnt = 0
(1..N).each do |i|
  r = routes[i]
  if r.empty?
    cnt += 1
    next
  end

  ah = H[i-1]
  bh = routes[i].map{|j| H[j-1]}.max
  if ah > bh
    cnt += 1
  end
end

puts cnt
