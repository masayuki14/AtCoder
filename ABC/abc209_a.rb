(A, B) = gets.chomp.split.map(&:to_i)

 if A > B
   puts 0
   return
 end

puts B - A + 1

