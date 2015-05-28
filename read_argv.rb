require_relative 'converter'
ar = []
ARGV.each do |a|
  if /.*.ass/.match(a)
    puts "Файлы для конвентирования: #{a}"
    ar << a
  else
    puts "#{a} не является файлом ass"
  end
end
ob = Converter.new(ar)
ob.zapusk
