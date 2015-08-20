require 'csv'
#customers = CSV.read('customers.csv')

CSV.foreach('customers.csv') do |row|
  puts row.inspect
end

# if you have comma-separated data as a String object in Ruby, you can convert
# the data to the Ruby representation of CSV (where the table is an array
# containing other arrays i.e. the rows) with the CSV.parse method:
a_string = "Dan,34\nMaria,55"
CSV.parse(a_string) #=> [["Dan", "34"], ["Maria", "55"]]

#you can also provide a block to CSV.parse
CSV.parse(a_string) { |row| puts row.inspect }
#=> produces ["Dan", "34"] and ["Maria", "55"] on separate lines

#CSV.parse (without a block) === CSV.read interms of output
#CSV.parse (with a block) === CSV.foreach interms of output
average_money_spent = Array.new
  CSV.foreach('customers.csv', converters: :numeric) do |row|
    average_money_spent << row[2] / row[1]
    # row is just an ordinary array and you access its elements with []
  puts average_money_spent
  end #=> Undefined method '/' for "2548":String
