require_relative 'city'
require_relative 'rail_road_manager'

# Default values for the given challenge
input = ['AB5', 'BC4', 'CD8', 'DC8', 'DE6', 'AD5', 'CE2', 'EB3', 'AE7'].sort.map(&:downcase)

if ARGV[0] == "--interactive"
  puts "Enter your list: "
  input = [STDIN.gets.chomp]

  # Use a regex to check if all entries fit input's expected format
  input.each do |entry|
    unless entry.match? /^[A-E][A-E]([0-9])*$/
      puts "Invalid entry: #{entry}"
      exit
    end
  end
end

# Auxiliar Arrays that are used to build the neighborhood graph
arr_a = []
arr_b = []
arr_c = []
arr_d = []
arr_e = []

# Reads the input and builds a hash for each two cities distance
input.each do |x|
  city_info = x.split('')
  source = city_info[0]
  destination = city_info[1].to_sym
  distance = city_info[2].to_i

  case source
  when 'a'
    arr_a << { destination => distance }
  when 'b'
    arr_b << { destination => distance }
  when 'c'
    arr_c << { destination => distance }
  when 'd'
    arr_d << { destination => distance }
  when 'e'
    arr_e << { destination => distance }
  end
end

# Creates a single node (represented as a hash) for each city
a_neighborhood = arr_a.reduce({}, :merge)
b_neighborhood = arr_b.reduce({}, :merge)
c_neighborhood = arr_c.reduce({}, :merge)
d_neighborhood = arr_d.reduce({}, :merge)
e_neighborhood = arr_e.reduce({}, :merge)

a = City.new(:a, a_neighborhood)
b = City.new(:b, b_neighborhood)
c = City.new(:c, c_neighborhood)
d = City.new(:d, d_neighborhood)
e = City.new(:e, e_neighborhood)

rail_road_manager = RailRoadManager.new

puts "Output #1: #{ rail_road_manager.distance([a, b, c])}"
puts "Output #2: #{ rail_road_manager.distance([a, d]) }"
puts "Output #3: #{ rail_road_manager.distance([a, d, c]) }"
puts "Output #4: #{ rail_road_manager.distance([a, e, b, c, d]) }"
puts "Output #5: #{ rail_road_manager.distance([a, e, d]) }"
puts "Output #6: #{ rail_road_manager.trips_counter(c.zipcode,
                                          c.zipcode,
                                          4)}"

puts "Output #7: #{ rail_road_manager.trips_counter(a.zipcode,
                                                    c.zipcode,
                                                    5)}"

