require 'terminal-table'

rows = []
rows << ['One', 1]
rows << ['Two', 2]
rows << ['Three', 3]
p rows
table = Terminal::Table.new :rows => rows
puts table