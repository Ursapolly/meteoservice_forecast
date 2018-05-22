require 'forecast'

describe Forecast do
  describe '#to_s' do
      Forecast.new(
        date: Date.parse('22.05.2018'),
        daytime: 'утро',
        min_temp: 11,
        max_temp: 14,
        max_wind: 7,
        clouds: 'облачно'
      )

    it 'shows temp range' do
      expect(forecast.to_s).to include('+11..+14')
    end

    it 'shows date' do
      expect(forecast.to_s).to include('22.05.2018')
    end

    it 'shows max wind' do
      expect(forecast.to_s).to include('ветер 7 м/с')
    end

    it 'shows cloudiness' do
      expect(forecast.to_s).to include('облачно')
    end
  end
end