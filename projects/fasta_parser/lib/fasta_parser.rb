require "fasta_parser/version"

module MyParser

  class FastaParser


    
    def initialize()
      @filename = ""
      @list_of_positions = []
      @current_iteration = 0
    end

    attr_accessor:filename
    attr_accessor:list_of_positions
    attr_accessor:current_iteration 

    # 1) Open a FASTA file by passing the path as a String. E.g. in the same 
    # you open a file
    ## 

    def open(filename)
      @filename = filename
      input = File.new(filename)
      ## This should return an array of pointer positions so the user is 
      ## able to iterate through all the entries
      list_of_positions = []

      pos = input.pos
      input.each do |entry|   
        
        if entry.include? ">"
          list_of_positions << pos
        end 
        pos = input.pos
         
      end

      input.close
       

      @list_of_positions = list_of_positions
    end

    # This method returns the entry matching the current_iteration number
    # At the end it increases the current_iteration by 1, but only if there is a 
    # next one
    def iterate()
      f = File.new(@filename)
      f.seek(@list_of_positions[@current_iteration], IO::SEEK_SET)
      
      header = f.readline
      f.seek(@list_of_positions[@current_iteration], IO::SEEK_SET)
      ## Now the sequence
      sequence =[]
      f.each do |line|
        unless line.include? ">"
          sequence << line
        else
          break
        end
      end




      if @list_of_positions.length > @current_iteration
          @current_iteration += 1
      else
          "No more entries left after this one!"
      end

      entry = Entry.new(header,sequence)

      return entry
    end
  end


  # Parses the entry into a class "Entry" that has methods to 
  # return the GI number, the accession, the sequence without new lines,
  # and be able to print the entry back out in the same format it 
  # into parsing
  class Entry
    
    def initialize(header, sequence)
      @header = header
      @sequence = sequence
    end

    # Setter and Getter methods
    attr_accessor:header
    attr_accessor:sequence

    def getGInum()
      gi_num = @header[4..11] 
    end

    def getAccession()
      gi_num = @header[17..27] 
    end

    ##### not done !!! ######
    def getSequence()
      #sequence = @sequence.to_s
      #sequence = sequence.tr_s("\n","")
    end

    def printEntry()
      puts @header
      puts @sequence
    end

  end
  
end