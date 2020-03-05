N = gets.chomp.split.map(&:chomp).map(&:to_i)
@points = readlines.map{|l| l.chomp.split.map(&:to_i)}

max_length = 0
l = nil

@points.each do |a|
  @points.each do |b|
    next if a == b
    l = Math.sqrt((a[0]-b[0])**2 + (a[1]-b[1]) **2)
    max_length = l if l > max_length
  end
end

puts max_length
