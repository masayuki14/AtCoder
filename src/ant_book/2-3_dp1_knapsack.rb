(N, W) = gets.chomp.split.map(&:to_i)
G = readlines.map{|l| l.split.map(&:to_i)}

@v = G.map{|g| g[0]}
@w = G.map{|g| g[1]}
@memo = Array.new(N+1) { Array.new(W+1).fill(nil) }


def dfs(i, j)
  # i番目の荷物を入れる
  # j以下の価値にする
  return @memo[i][j] if @memo[i][j]

  res_val = nil

  if i >= N
    res_val = 0
  else
    # i番目を選べない
    if @w[i] > j
      res_val = dfs(i+1, j)
    else
      # i番目を選ぶ場合と選ばない場合で比較
      res_val = [dfs(i+1, j - @w[i]) + @v[i], dfs(i+1, j)].max
    end
  end

  #pp [i, j, res_val]
  @memo[i][j] = res_val
  return res_val
end

def solve_dp
  dp = Array.new(N+1) { Array.new(W+1).fill(nil) }

  N.downto(0).each do |i|
    0.upto(W).each do |j|
      if i == N
        dp[i][j] = 0
      else
        if @w[i] > j
          dp[i][j] = dp[i+1][j]
        else
          dp[i][j] = [
            dp[i+1][j],
            dp[i+1][j-@w[i]] + @v[i]
          ].max
        end
      end
    end
  end

  #pp dp
  #dp.flatten.max
  dp[0][W]
end

#puts dfs(0, W)
puts solve_dp
