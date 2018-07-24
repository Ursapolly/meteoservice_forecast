require 'uri'
require 'net/http'
require 'rexml/document'
require_relative 'lib/forecast'

CITIES = {
  37 => 'Москва',
  69 => 'Санкт-Петербург',
  122 => 'Екатеринбург',
  146 => 'Красноярск',
  99 => 'Новосибирск',
  98 => 'Владивосток'
}.invert.freeze

city_names = CITIES.keys

puts 'Выберите город:'
city_names.each_with_index {|city, index| puts "#{index + 1}: #{city}"}

user_choice = STDIN.gets.to_i
unless user_choice.between?(1, city_names.size)
  user_choice = gets.to_i
  puts "Введите число от 1 до #{city_names.size}"
end

city_index = CITIES[city_names[user_choice - 1]]
url = "https://xml.meteoservice.ru/export/gismeteo/point/#{city_index}.xml"

response = Net::HTTP.get_response(URI.parse(url))
doc = REXML::Document.new(response.body)

city = URI.unescape(doc.root.elements['REPORT/TOWN'].attributes['sname'])
forecast_tags = doc.root.elements['REPORT/TOWN'].elements.to_a

puts city
puts
forecast_tags.each do |tag|
  puts Forecast.read_xml(tag)
  puts
end