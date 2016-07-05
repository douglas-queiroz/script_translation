
languageColumn = 0

traducoes = []

File.open("Planilha", 'r') do |file|
	file.each do |line|
		traducoes << line.split("|")
	end
end

path = 'ingles'

new_traducoes = []
lines = IO.readlines(path).map

i = 0
lines.each do |line|
	i += 1

	text = /<<.+[0-9]>>/.match(line)
	if text
		row = text.to_s.gsub(/<<|>>/, "").to_i
		
		newString = traducoes[row-1][languageColumn]
		if row == 9
			puts newString	
		end

		new_traducoes << line.gsub(text.to_s, newString)

		if i == 83
			puts line
			puts "passou 1"
		end
	else
		new_traducoes << line
		if i == 83
			puts line
			puts "passou 2"
		end
	end
end

File.open("new_strings", 'w') do |file|
	new_traducoes.each do |line|
		file.puts line
	end
end
