def find_from_nega(nega, posi, k)
  n_posi = (k / nega.length).to_i
  p_posi = (k % posi.length).to_i
  nega[n_posi] * posi[p_posi]
end

def find_from_posi(nega, posi, k)
  ## nega ngea
  f_posi = (k / nega.length).to_i
  f_ary = nega[0, f_posi+1]
  s_ary = nega.select{|a| a != nega[f_posi]}

  p nega_combi = f_ary.map{|x| s_ary.map{|y| x * y}}.flatten

  # posi posi
  f_posi = (k / posi.length).to_i
  f_ary = posi[0, f_posi+1]
  s_ary = posi.select{|a| a != posi[f_posi]}

  p posi_combi = f_ary.map{|x| s_ary.map{|y| x * y}}.flatten
  p (nega_combi + posi_combi).sort
  (nega_combi + posi_combi).sort[k]
end


line1 = gets.chomp.split(" ")
n = line1[0].to_i
k = line1[1].to_i
a = gets.chomp.split(" ")
a = a.map{|e| e.to_i}

nega = a.select{|e| e < 0}.sort{|a,b| a <=> b}
zero = a.select{|e| e == 0}
posi = a.select{|e| e > 0}.sort{|a,b| a <=> b}

# pp nega
# pp zero
# pp posi

# nega 組み合わせ
nega_combi = if nega.length > 0 then nega.length * posi.length else 0 end
zero_combi = if zero.length > 0 then nega.length * zero.length + zero.length * zero.length - 1 + zero.length * posi.length else 0 end
posi_combi = if posi.length > 0 then posi.length * (posi.length - 1) else 0 end + if nega.length > 0 then posi.length * (posi.length - 1) else 0 end

 pp nega_combi, zero_combi, posi_combi

if nega_combi >= k
  puts find_from_nega(nega, posi, k)
elsif nega_combi + zero_combi >= k
  puts 0
else posi_combi
  k = k - zero_combi - nega_combi
  puts find_from_posi(nega, posi, k)
end


