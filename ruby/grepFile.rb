# read the file line by line
x = File.readlines("myData.txt")

# what is the user searching for
print "Enter search text> "
search_text = gets.chomp

# for each line that contains search_string print it out along with the line number
i = 1

x.each do |line|
    if line.include? search_text
        puts "LINE #{i}: #{line}"
    end
    i = i + 1
end