string = File.open("{GoldFishSubs} Padam Padam ep. 17.ass", 'r'){|file| file.read}
#puts string
puts string.scan(/Dialogue.*/)
#arrey = stringbezzaglaviya.split(",,")
#puts arrey
#arrey.drop_while {|a| a.include?("Dialogue")}
#puts arrey
