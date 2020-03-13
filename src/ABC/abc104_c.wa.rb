# AtCoder Beginner Contest 104
# C - All Green
# https://atcoder.jp/contests/abc104/tasks/abc104_c
ENV[Z='RUBY_THREAD_VM_STACK_SIZE']||exec({Z=>'100000000'},'ruby',$0)
INF = 10**19
(D, G) = gets.split.map(&:to_i)
point = 0
@scores = readlines.map{|l| l.chomp.split.map(&:to_i)}
@scores = @scores.map{|s| [point += 100] + s}.reverse

def dfs(i, sum)
  #pp [i, sum]
  return INF if i == @scores.length
  return 0 if G <= sum
  if (G - sum) / @scores[i][0] <= @scores[i][1]
    return (G - sum) / @scores[i][0]

  elsif @scores[i][0] * @scores[i][1] + @scores[i][2] > (G - sum)
    return @scores[i][1]

  elsif (G - sum) > @scores[i,@scores.length].reduce(0){|sum,s| sum+s[0]*s[1]+s[2]}
    return INF
  else
    counts = []
    # 全部使う
    counts << @scores[i][1] + dfs(i+1, sum+@scores[i][0]*@scores[i][1]+@scores[i][2])

    # 使わない
    counts << dfs(i+1, sum)

    # max - 1 使う
    (1...@scores[i][1]).each do |n|
      cnt = @scores[i][1]-n + dfs(i+1, sum+@scores[i][0]*(@scores[i][1]-n))
      break if cnt > INF
      #break if counts.last < cnt
      counts << cnt
    end

    #pp ["count#{i}"] + counts
    return counts.min
  end
end

puts dfs(0, 0)

#n = []
#@scores.each do |s|
#  n << [s[1],   s[0]*s[1]+s[2]]
#  n << [s[1]-1, s[0]*(s[1]-1) ]
#end
#
#n.sort{|a,b| (b[1]<=>a[1])==0 ? a[0]<=>b[0] : b[1]<=>a[1]}
#
#num = 0
#at_max = n[0][1] + 1
#g = G
#
#(0...(n.length)).each do |s|
#  next if at_max < s[0]
#  if s[1] > g
#    num += s[0]
#    break
#  elsif 
#end

#def by_greater(scores)
#  g = G
#  num = 0
#  scores.each do |s|
#    if g / s[0] < s[1]
#      num += g / s[0]
#      g = 0
#      break
#    elsif s[0] * s[1] + s[2] > g
#      num += s[1]
#      g = 0
#      break
#    else
#      num += s[1]
#      g = g - s[0] * s[1] - s[2]
#    end
#  end
#  return -1 if g > 0
#  num
#end
#
#min = -1
#(0...(@scores.length)).each do |_|
#  count = by_greater(@scores)
#  pp [count, @scores]
#  break if count < 0
#  if (min < 0) || (count < min)
#    min = count
#  end
#  @scores.shift
#end

