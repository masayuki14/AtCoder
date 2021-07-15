(N, X) = gets.chomp.split.map(&:to_i)
A = gets.chomp.split.map(&:to_i)

sum = 0
A.each_with_index{|a,i|
  if i % 2 == 0
    sum += a
  else
    sum += a -1
  end
}


if sum <= X
  puts 'Yes'
else
  puts 'No'
end

