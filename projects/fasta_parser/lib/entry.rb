 class Entry
    
    def initialize(header,sequence, gi_num=nil, accession_num=nil )
      # Header is ">XX|GGGGGGGG|XXX|AAAAAAAAAAA| ..."
      @header = header
      
      
      @sequence = sequence.join
      @accession = accession_num
      @gi_num = gi_num
    end

    def header()
      @header
    end

    

    # returns the GI number
    def gi_num()

      gi_num = String.new
      header = []
      header = @header.split(//)
      i = header.index("|") + 1
      
     
      while true 
        unless header[i] == "|"
          gi_num << header[i]
          #return gi_num
        else
          break
        end
        i += 1
      end
      
      
      @gi_num ||= gi_num  

      
    end

    

    def gi_num=(gi)
      @gi_num = gi
    end
      
    
    # returns the accession number
    def accession_num()

      accession_num = String.new
      header = []
      header = @header.split(//)
      # Header is         "...|GGGGGGGG         | ... |AAAAAAAAAAA| ..."
      i = header.index("|") +  @gi_num.length + 2

      while true 
        unless header[i] == "|"
          i += 1
        else
          break
        end  
      end

      i += 1

      while true 
        unless header[i] == "|"
          accession_num << header[i]
        else
          break
        end
        i += 1
      end


      @accession_num ||= accession_num 
    end

    # Returns the sequence of the entry without "\n"
    def sequence()
      seq = @sequence
      seq.delete("\n")
    end

    # The entry is printed as seen in the original file
    def printEntry()
      puts @header
      puts @sequence
    end

  end