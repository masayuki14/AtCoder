(@n,), @a, (@k,) = readlines.map{|l| l.split.map(&:to_i)}

def dfs ( i, sum )
  pp [i, sum]

  return sum == @k if i == @a.length 

  return false if i >= @a.length

  return true if (dfs(i + 1, sum))

  return true if (dfs(i + 1, sum + @a[i]))

  return false
end


if dfs(0, 0)
  p 'Yes'
else
  p 'No'
end
