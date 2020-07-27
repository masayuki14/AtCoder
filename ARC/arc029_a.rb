# AtCoder Regular Contest 029
# A - 高橋君とお肉
# https://atcoder.jp/contests/arc029/tasks/arc029_1
N = gets.to_i
@t = readlines.map{|l| l.to_i}

def dfs(i, c1, c2)

  return [c1, c2].max if i == N

  # c1で焼く
  cost1 = dfs(i+1, c1+@t[i], c2)

  # c2で焼く
  cost2 = dfs(i+1, c1, c2+@t[i])

  return [cost1, cost2].min
end

puts dfs(0, 0, 0)
