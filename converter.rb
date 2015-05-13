class Converter
#  def initialize(p)

  string = File.open("{GoldFishSubs} Padam Padam ep. 17.ass", 'r'){|file| file.read}
  bez_zag = string.scan(/Dialogue.*/)
  a = bez_zag.join("~@#")
  while a.include?("Dialogue:") do
       a.slice!(/Dialogue:../)
     end
  a.gsub!(/~@#,/, "~@#0")
  a.gsub!(/^./,'0')
  a.gsub!(/(?<first>\d{2}):(?<second>\d{2}):(?<third>\d{2})\.(?<fourth>\d{2}),(?<fifth>\d):(?<sixth>\d{2}):(?<seventh>\d{2})\.(?<eighth>\d{2}),/,'\k<first>:\k<second>:\k<third>,0\k<fourth>,,0\k<fifth>:\k<sixth>:\k<seventh>,0\k<eighth>,,/')
  #a.gsub!(/,,.*,,\d{4},\d{4},\d{4},,/,",,")
  puts a
end




#arrey = stringbezzaglaviya.split(",,")
#puts arrey
#arrey.drop_while {|a| a.include?("Dialogue")}
#puts arrey
