require 'test/unit'
require_relative '../lib/fasta_parser'

class MyUnitTests < Test::Unit::TestCase

	#def setup()
	#end

	def test_parser()

		# New FastaParser
		current_file = MyParser::FastaParser.new()

		# Test open()
	   	current_file.open("vertebrate_mammalian.2.rna.fna")
	   	assert_equal(current_file.list_of_positions.length, 14703)
	   	assert_equal(current_file.list_of_positions[0],0)
	   	
	   	# Test next()
	   	entry = current_file.next()
	   	entry2 = current_file.next()
	   	assert_equal(entry.header,">gi|73945336|ref|XM_850463.1| PREDICTED: Canis familiaris hypothetical protein LOC606754 (LOC606754), mRNA\n")
	   	assert_equal(current_file.current_iteration,2)
	   	entry3 = current_file.next()
	   	entry4 = current_file.next()

	   	# Test getGInum()
	   	giNum = entry2.gi_num()
	   	assert_equal(giNum,"73945338")
	   	giNum = entry4.gi_num()
	   	assert_equal(giNum,"73945342")

	   	# Test getAccession()
	   	accession = entry2.accession_num()
	   	assert_equal(accession,"XM_533360.2")
	   	accession = entry4.accession_num()
	   	assert_equal(accession,"XM_533363.2")

	   	# Test of getSequence()
	   	sequence = entry4.sequence()
	   	assert_equal(sequence,"CCGGGCGCGCGCGGCCCCTCATGTCGTACATGCTCCCACACCTGCACAACGGCTGGCAGGTGGATCAGGCCATCCTGTCGGAGGAGGACCGCGTGGTCGTCATCCGCTTTGGACACGACTGGGACCCCACGTGTATGAAGATGGACGAGGTGCTGTACAGCATCGCGGAGAAGGTTAAAAATTTTGCAGTTATTTATCTTGTGGATATTACAGAAGTGCCTGACTTCAACAAAATGTATGAGTTGTACGATCCGTGTACTGTCATGTTTTTCTTCAGGAACAAGCACATCATGATTGACCTGGGTACTGGTAACAACAACAAGATCAACTGGGCCATGGAAGACAAACAGGAAATGATAGACATCATCGAGACTGTGTACCGGGGCGCCCGGAAGGGCCGCGGCCTGGTTGTGTCTCCAAAGGACTACTCCACGAAATACAGATACTGAGCTCAGCCCAGTCTCCGTGCACAGAAGTGGTGCAGAATTGTTTTCACATGGAAATATTTGAAACTATTTAAAGCCTTAGAGAAAGCGTTTGGAAGTGAATTCAAAGCTCAAGGACTTGGAGGGTCTTTGTAGTAAGGGTTGCATGGCATCAACTCTTTGCCTGTCTGGCCATTGTATTTTTATATTAGCAAATATTTGTAAATACCTAGCTGACACGAATAAAGTACACAGTGATGGAAAGTC")
	   	
	   	### Test extra credit ###
	   	fifth_entry = current_file.entry_num(5)
	   	assert_equal(fifth_entry.gi_num(),"73945344")
	      		   	
		assert_raise RuntimeError do
			fifth_entry = current_file.entry_num(14704)
			fifth_entry = current_file.entry_num(-4)
		end
	   	
	    

	   	number_of_elements = current_file.count()
	   	assert_equal(number_of_elements,14703)

	   	first_entry = current_file.first()
	   	assert_equal(first_entry.accession_num(),"XM_850463.1")

	   	first_entry = current_file.last()
	   	assert_equal(first_entry.accession_num(),"XM_853369.1")



	end

	

end