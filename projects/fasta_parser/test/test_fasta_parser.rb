require 'test/unit'
require_relative '../lib/fasta_parser'

class MyUnitTests < Test::Unit::TestCase

	def test_parser()
		hallo = MyParser::FastaParser.new()
	   	vierzehn = hallo.open("vertebrate_mammalian.2.rna.fna")
	   	assert_equal(vierzehn.length, 14703)
	   	assert_equal(vierzehn[0],0)
	   	entry = hallo.iterate()
	   	entry2 = hallo.iterate()
	   	assert_equal(entry.header,">gi|73945336|ref|XM_850463.1| PREDICTED: Canis familiaris hypothetical protein LOC606754 (LOC606754), mRNA\n")
	   	assert_equal(hallo.current_iteration,2)
	   	included = entry2.getGInum
	   	assert_equal(included,"73945338")
	   	included = entry2.getAccession()
	   	assert_equal(included,"XM_533360.2")
	   	


	   	entry3 = hallo.iterate()
	   	entry4 = hallo.iterate()
	   	included = entry4.getGInum()
	   	assert_equal(included,"73945342")
	   	included = entry4.getAccession()
	   	assert_equal(included,"XM_533363.2")
	   	sequence = entry4.getSequence
	   	assert_equal(sequence,"hahaha")
	   	

	end

	

end