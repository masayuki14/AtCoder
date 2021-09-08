# AtCoder Beginner Contest 208
# D - Shortest Path Queries 2
# https://atcoder.jp/contests/abc208/tasks/abc208_d
#
# ワーシャルフロイドで解く
(N, M) = gets.chomp.split.map(&:to_i)

# 初期化 - 到達出来ない時はコスト。無限
inf = 10 ** 12
dist = Array.new(N) { Array.new(N) { inf } }

# 同じ都市への移動はコスト0
(0...N).each do |i|
  dist[i][i] = 0
end

M.times {
  # k = 0 の時は直接遷移するコストとなる。
  (s,t,cost) = gets.split.map(&:to_i)
  dist[s-1][t-1] = cost
}

sum = 0

k=0
while k < N
  distk = dist[k]

  s=0
  while s < N
    dists = dist[s]
    distsk = dists[k]
    t=0

    while t < N
      d = distsk + distk[t]  # dist[s][k] + dist[k][t]
      dists[t] = d if dists[t] > d
      t += 1
    end
    sum += dists.sum % inf
    s += 1
  end
  k += 1
end

puts sum
