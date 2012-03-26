
require 'java'

list = java.util.ArrayList.new
list <<  'string qualquer'
list << 10
list.each do |i|
    puts "Item: #{i} - classe: #{i.class}"
end
