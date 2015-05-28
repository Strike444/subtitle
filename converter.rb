class Converter

  def initialize(ar)
  @argum = ar
  end

  def zapusk
    string = File.open(@argum[0], 'r'){|file| file.read}

  # Ищем строки с Dialogue
  bez_zag = string.scan(/Dialogue.*/)
  a = bez_zag
  a = bez_zag.join("~@#")
  a.gsub!(/^/,"~@#")

  # Удаляем Dialogue
  while a.include?("Dialogue:") do
     a.slice!(/Dialogue:/)
  end

  # Удаляем все что в фигурных скобках (со скобками)
  while /{.+?}/.match(a) do
    a.slice!(/({.+?})/)
  end

  # Приводим часы к нормальному виду
  a.gsub!(/~@# (?<hour>\d{1}),/, '~@#\k<hour>')

  # Приводим к нормальному виду время
  a.gsub!(/(?<first>\d{2}):(?<second>\d{2}):(?<third>\d{2})\.(?<fourth>\d{2}),(?<fifth>\d):(?<sixth>\d{2}):(?<seventh>\d{2})\.(?<eighth>\d{2}),/,'\k<first>:\k<second>:\k<third>,0\k<fourth>,,0\k<fifth>:\k<sixth>:\k<seventh>,0\k<eighth>,,/')

  a.gsub!(/,,[^(\d{2}:\d{2}:\d{2},\d{3})]*.?,,\d+,\d+,\d+/,'')

  a.gsub!(/(?<timestart>(\d{2}:\d{2}\:\d{2},\d{3})),,(?<timeend>(\d{2}:\d{2}\:\d{2},\d{3}))/,'\k<timestart> --> \k<timeend>')

  a.gsub!(/,,/, "\r\n")

  a.gsub!(/\\N/, "\n")

  mas = a.split("~@#")

  mas.delete('')

  # Добовляем номера в начале каждого элемента массива
  mas_length = mas.length
  numbers = Array.new(mas_length) {''}

  for i in 0..(numbers.length-1)
    numbers[i] = (i + 1).to_s << "\n"
  end

  mas_with_numbers = numbers.zip(mas)

  n = Array.new(mas_length) {''}
  for j in 0..(numbers.length-1)
    n[j] = '' << "\n"
  end

  itog_mas = mas_with_numbers.zip(n)

  puts "Записываю файл #{@argum[0].gsub(/\.ass/,'')}.srt"

  File.open("#{@argum[0].gsub(/\.ass/,'')}.srt", 'w'){ |file| file.puts  itog_mas }
  end
end
