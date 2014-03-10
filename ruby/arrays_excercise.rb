dotw = "Monday Tuesday Wednesday Thursday Friday Saturday Sunday".split

dotw.unshift(dotw.pop)

puts dotw

puts "---"

dotw2 = [["Monday","Tuesday","Wednesday","Thursday","Friday"],["Saturday","Sunday"]]

dotw2.delete_at 1

dotw2.flatten!
dotw2.sort!

puts dotw2