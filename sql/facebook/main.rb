require 'pry'
require 'sqlite3'

db = SQLite3::Database.open('facebook.db')

db.execute( "select * from users" ) do |row|
  p row
end

puts "-=-=-=-=-"

#this saves the first value in columns and the subsequent values in rows by combining them
#db.execute2 returns an array of arrays where the first array is the column names and each subsequent array is a row
columns, *rows = db.execute2( "select * from users" )

binding.pry

rows.each do |row|
  row.each_with_index do |value,i|
    puts "#{columns[i]}: #{value}"
  end
end