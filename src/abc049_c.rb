s = gets.chomp

if s =~/^(dreamer|eraser|dream|erase)+$/
  puts "YES"
else
  puts "NO"
end

#words = ["dreamer", "eraser", "dream", "erase"];
#
#while s.length > 0 do
#  words.each do |w|
#    if s =~ /^#{w}/
#      s = s.slice(w.length, s.length - w.length)
#      puts s
#      break
#    end
#
#  end
#
#  if s.length < "dream".length
#    break
#  end
#end
#
#puts s.length == 0 ? "YES" : "NO"
