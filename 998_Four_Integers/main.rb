
i = gets.chomp
# i = '1 2 3 4'
l1 = i.split(' ').map(&:to_i).sort()
l2 = ((l1.min)..(l1.max)).to_a
puts l1 == l2 ? 'Yes' : 'No'
