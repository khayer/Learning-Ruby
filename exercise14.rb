user = ARGV.first
prompt ='>'

puts "Hi #{user}, I'm the #{$0} script."
puts "Like me #{user}?"
print prompt
likes = STDIN.gets.chomp()

puts "Where do you live #{user}?"
print prompt
lives = STDIN.gets.chomp()


puts "What kind of Computer do you have?"
print prompt
computer = STDIN.gets.chomp()

puts <<MESSAGE
Alright, so you said #{likes} about liking me.
You live in #{lives}. Not sure where that is. 
And you have a #{computer} pc. Nice.
MESSAGE

