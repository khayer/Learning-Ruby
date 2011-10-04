from_file, to_file = ARGV
script = $0

puts "Copying from #{from_file} to #{to_file}"

input = IO.read(from_file)

puts "The input file is #{input.length} bytes long"

puts "does the output file exist? #{File.exists? to_file}"

puts "Readz, hit Return to contfnfjkgg"

STDIN.gets

output = File.open(to_file, 'w')
output.write(input)

output.close()
