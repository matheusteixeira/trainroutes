require_relative 'city_utils'

class RailRoadManager
  # Given a array of cities, like [a, e, d]
  # it returns route's distance
  def distance(cities)
    distance = 0
    cities.each_with_index do |city, i|
      return distance if i + 1 > cities.size - 1
      return 'NO SUCH ROUTE' unless city.neighbours[cities[i+1].name]
      distance += city.neighbours[cities[i+1].name]
    end
  end

  # Count how many trips thera are between start_city
  # and end_city with a max_stops number of stops.
  # Recursively counts the amount of trips based on CITIES_MAP
  def trips_counter(start_city_zipcode, end_city_zipcode, max_stops)
    trips_count = 0
    all_cities = CityUtils::CITIES_MAP

    return 1 if start_city_zipcode == end_city_zipcode && max_stops == 0
    return 0 if max_stops <= 0

    (all_cities.size).times do |n_city|
      if all_cities[start_city_zipcode][n_city] == 1
        trips_count += trips_counter(n_city, end_city_zipcode, max_stops - 1)
      end
    end

    trips_count
  end
end