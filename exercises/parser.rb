# FASTA Parser

class FastaElement

	def initialize(description, sequence="")
		@description = description
		@sequence = sequence
	end

	def addSequence(sequence)
		@sequence << sequence
		
	end

	def printFastaElement()
		puts "Description: " + @description
		puts "Sequence: " + @sequence
	end

end



def fasta_reader (directory)

	fasta = IO.readlines(directory)
	
	sequence = ""
	# counter in case there is more than one organism in the group
	counter = -1
	elements = []

	for line in fasta

		if line.include? ">"
			
			counter += 1 
			puts counter
			elements[counter] = FastaElement.new(line.delete(">"))
			
		else 
		
			elements[counter].addSequence(line)
			

		end
	end
	
	puts elements.length

	for e in elements
		e.printFastaElement
    end
	 
		  
	
end



fasta_reader("test.fasta")




