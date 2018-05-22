# encoding: utf-8

require 'date'

class Forecast
  CLOUDINESS = %w(Ясно Малооблачно Облачно Пасмурно).freeze
  DAYTIME = %w(Ночь Утро День Вечер).freeze

  def initialize(parameters)
    @date = parameters[:date]
    @daytime = parameters[:daytime]
    @min_temp = parameters[:min_temp]
    @max_temp = parameters[:max_temp]
    @max_wind = parameters[:max_wind]
    @clouds = parameters[:clouds]
  end

  def self.read_xml(node)
    day = node.attributes['day']
    month = node.attributes['month']
    year = node.attributes['year']
    new(
      date: Date.parse("#{day}.#{month}.#{year}"),
      daytime: DAYTIME[node.attributes['tod'].to_i],
      min_temp: node.elements['TEMPERATURE'].attributes['min'].to_i,
      max_temp: node.elements['TEMPERATURE'].attributes['max'].to_i,
      max_wind: node.elements['WIND'].attributes['max'].to_i,
      clouds: node.elements['PHENOMENA'].attributes['cloudiness'].to_i
    )
  end

  def today?
    @date == Date.today
  end

  def temperature_range_string
    range = ''
    range << '+' if @min_temp > 0
    range << "#{@min_temp}.."
    range << '+' if @max_temp > 0
    range << @max_temp.to_s
  end

  def to_s
    today = today? ? 'Сегодня' : @date.strftime('%d.%m.%Y')
    today << ", #{@daytime}\n" \
      "#{temperature_range_string}, ветер #{@max_wind} м/с, " \
      "#{CLOUDINESS[@clouds]}"
  end
end
