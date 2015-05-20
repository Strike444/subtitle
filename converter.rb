class Converter
  # Открываем файл
  string = File.open("{GoldFishSubs} Padam Padam ep. 17.ass", 'r'){|file| file.read}

  # Ищем строки с Dialogue
  bez_zag = string.scan(/Dialogue.*/)
  a = bez_zag
  a = bez_zag.join("~@#")
  a.gsub!(/^/,"~@#")

  # Удаляем Dialogue
  while a.include?("Dialogue:") do
     a.slice!(/Dialogue:/)
  end

  # a.gsub!(/\n/,'')

  # Удаляем все что в фигурных скобках (со скобками)
  while /{.+?}/.match(a) do
    a.slice!(/({.+?})/)
  end

  # Приводим часы к нормальному виду
  a.gsub!(/~@# (?<hour>\d{1}),/, '~@#\k<hour>')

  # Приводим к нормальному виду время
  a.gsub!(/(?<first>\d{2}):(?<second>\d{2}):(?<third>\d{2})\.(?<fourth>\d{2}),(?<fifth>\d):(?<sixth>\d{2}):(?<seventh>\d{2})\.(?<eighth>\d{2}),/,'\k<first>:\k<second>:\k<third>,0\k<fourth>,,0\k<fifth>:\k<sixth>:\k<seventh>,0\k<eighth>,,/')

  # Удаляем ненужное
  while /,,[^(\d{2}:\d{2}:\d{2},\d{3})]*,,\d{4},\d{4},\d{4}/.match(a) do
    a.slice!(/,,[^(\d{2}:\d{2}:\d{2},\d{3})]*,,\d{4},\d{4},\d{4}/)
  end

end
