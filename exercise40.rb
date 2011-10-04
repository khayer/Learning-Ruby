# This is an exercise about hashes

# hash: state => city 
cities = {
	'CA' => 'San Francisco',
	'ML' => 'Detroit',
	'FL' => 'Jacksonville'
}

# adding two more pairs of states and cities
cities['NY'] = 'New York'
cities['OR'] = 'Portland'

# method "find_city" returns the matching city for a give state 
# if it is included in the hashmap
def find_city(map,state)
	if map.include? state
		return map[state]
	else 
		return "Not found!"
	end  
end

# hashmap can hold methods with a key as well 
cities[:find] = method(:find_city)


while true
	print "State? (Enter to quit)"
	state = gets.chomp

	break if state.empty?
	# Here the included method can be called
	puts cities[:find].call(cities, state)

end

