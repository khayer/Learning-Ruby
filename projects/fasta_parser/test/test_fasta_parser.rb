require 'test/unit'
require_relative '../lib/fasta_parser'

class MyUnitTests < Test::Unit::TestCase

	def setup()
		@current_file = MyParser::FastaParser.new()
		@current_file.open("vertebrate_mammalian.2.rna.fna")
	end

	def test_open()
		 
	   	assert_equal(@current_file.list_of_positions.length, 14703)
	   	assert_equal(@current_file.list_of_positions[0],0)
	end

	def test_each()
		entry1 = @current_file.next()
	   	entry2 = @current_file.next()
	   	entry3 = @current_file.next()
	   	entry4 = @current_file.next()
	   	@current_file.add_entry(entry1)
	   	@current_file.add_entry(entry2)
	   	@current_file.add_entry(entry3)
	   	@current_file.add_entry(entry4)

	   	gi_nums = @current_file.entries.map{|entry| entry.gi_num}
	   	assert_equal(gi_nums,["73945336", "73945338", "73945340", "73945342"])

	end
	   	
	def test_next()
	   	entry = @current_file.next()
	   	entry2 = @current_file.next()
	   	assert_equal(entry.header,">gi|73945336|ref|XM_850463.1| PREDICTED: Canis familiaris hypothetical protein LOC606754 (LOC606754), mRNA\n")
	   	assert_equal(@current_file.current_iteration,2)
	   	entry3 = @current_file.next()
	   	entry4 = @current_file.next()
   	end

	def test_gi_num()
		entry = @current_file.next()
	   	entry2 = @current_file.next()
	   	entry3 = @current_file.next()
	   	entry4 = @current_file.next()
	   	giNum = entry2.gi_num()
	   	assert_equal(giNum,"73945338")
	   	giNum = entry4.gi_num()
	   	assert_equal(giNum,"73945342")
	end

	def test_accession_num()
		entry = @current_file.next()
	   	entry2 = @current_file.next()
	   	entry3 = @current_file.next()
	   	entry4 = @current_file.next()
	   	accession = entry2.accession_num()
	   	assert_equal(accession,"XM_533360.2")
	   	accession = entry4.accession_num()
	   	assert_equal(accession,"XM_533363.2")
	end

	def test_sequence
		entry = @current_file.next()
	   	entry2 = @current_file.next()
	   	entry3 = @current_file.next()
	   	entry4 = @current_file.next()
	   	sequence = entry4.sequence()
	   	assert_equal(sequence,"CCGGGCGCGCGCGGCCCCTCATGTCGTACATGCTCCCACACCTGCACAACGGCTGGCAGGTGGATCAGGCCATCCTGTCGGAGGAGGACCGCGTGGTCGTCATCCGCTTTGGACACGACTGGGACCCCACGTGTATGAAGATGGACGAGGTGCTGTACAGCATCGCGGAGAAGGTTAAAAATTTTGCAGTTATTTATCTTGTGGATATTACAGAAGTGCCTGACTTCAACAAAATGTATGAGTTGTACGATCCGTGTACTGTCATGTTTTTCTTCAGGAACAAGCACATCATGATTGACCTGGGTACTGGTAACAACAACAAGATCAACTGGGCCATGGAAGACAAACAGGAAATGATAGACATCATCGAGACTGTGTACCGGGGCGCCCGGAAGGGCCGCGGCCTGGTTGTGTCTCCAAAGGACTACTCCACGAAATACAGATACTGAGCTCAGCCCAGTCTCCGTGCACAGAAGTGGTGCAGAATTGTTTTCACATGGAAATATTTGAAACTATTTAAAGCCTTAGAGAAAGCGTTTGGAAGTGAATTCAAAGCTCAAGGACTTGGAGGGTCTTTGTAGTAAGGGTTGCATGGCATCAACTCTTTGCCTGTCTGGCCATTGTATTTTTATATTAGCAAATATTTGTAAATACCTAGCTGACACGAATAAAGTACACAGTGATGGAAAGTC")
	end

	def test_entry_num
	   	fifth_entry = @current_file.entry_num(5)
	   	assert_equal(fifth_entry.gi_num(),"73945344")
	      		   	
		assert_raise RuntimeError do
			fifth_entry = @current_file.entry_num(14704)
			fifth_entry = @current_file.entry_num(-4)
		end
	end
	   	
	    
	def test_count
	   	number_of_elements = @current_file.count()
	   	assert_equal(number_of_elements,14703)
   	end

	def test_first
	   	first_entry = @current_file.first()
	   	assert_equal(first_entry.accession_num(),"XM_850463.1")
	end	


	def test_last
	   	first_entry = @current_file.last()
	   	assert_equal(first_entry.accession_num(),"XM_853369.1")
	end

end