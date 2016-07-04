# encoding: UTF-8
require 'spreadsheet' 
book = Spreadsheet.open('myexcel.xls')
excelLanguage = book.worksheet('Original')
languageColumn = 1

path = 'ingles'
lines = IO.readlines(path).map

new_strings = []
lines.each do |line|

	text = /<<.+[0-9]>>/.match(line)
	if text
		row = text.to_s.gsub(/<<|>>/, "").to_i

		puts row
		newString = excelLanguage.cell(543,languageColumn)
		# new_strings << line.gsub(text.to_s, newString)
	else
		new_strings << line
	end
end

File.open("new_strings", 'w') do |file|
	new_strings.each do |line|
		file.puts line
	end
end
