# Консольная программа «Прогноз погоды»

Программа читает данные из xml-файла, который лежит на сайте meteoservice.ru, и 
показывает погоду для Москвы, Санкт-Петербурга, Екатеринбурга, Красноярска, 
Новосибирска или Владивостока. 

## Установка и использование

Для запуска необходим ruby версии 2.3.7 или выше. Клонируйте или загрузите репозиторий приложения.
Находясь в папке проекта, запустите файл main.rb:

```
ruby main.rb
```

Далее выберите интересующий вас город. 



**Примечание:** в программу можно добавить другие города; просто скопируйте 
[отсюда](https://www.meteoservice.ru/content/export.html) индекс нужного города 
(он указан в xml-файле) и добавьте в массив:

```ruby
CITIES = {
  37 => 'Москва',
  69 => 'Санкт-Петербург',
  122 => 'Екатеринбург',
  146 => 'Красноярск',
  99 => 'Новосибирск',
  98 => 'Владивосток'
}.invert.freeze
```