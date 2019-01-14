require_relative 'city_utils'

class City
  attr_reader :name, :neighbours

  # name is a symbol that represents the city, i.e: :a
  # neighbours is a hash with the city neighhbours and the distance to it
  # i.e.: { b: 5, d: 5, e: 7 }
  def initialize(name, neighbours)
    @name = name
    @neighbours = neighbours
  end

  def zipcode
    CityUtils::CITIES_ZIPCODES.fetch(name, :unmapped)
  end
end
