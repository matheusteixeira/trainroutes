module CityUtils
  # The Codes maps the City to its index on the map
  CITIES_ZIPCODES = { a: 0, b: 1, c: 2, e: 3, d: 4 }.freeze

  # This array represents the cities and its neighborhoods
  # Each Line is a City, and the number 1 means the city
  # has a train that connects with the one of the same index.
  CITIES_MAP = [
  #a, b, c, d, e
  [0, 1, 0, 1, 1], # a
  [0, 0, 1, 0, 0], # b
  [0, 0, 0, 1, 1], # c
  [0, 0, 1, 0, 1], # d
  [0, 1, 0, 0, 0]  # e
  ].freeze
end