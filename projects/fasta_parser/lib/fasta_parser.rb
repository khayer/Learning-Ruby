require "fasta_parser/version"

module MyParser

  class FastaParser
    
     
    def initialize()
      # needed to be able to access the file again
      @filehandler = nil
      # positions hold the pointer positions of the header
      @list_of_positions = []
      # this is importan for iteration()
      @current_iteration = 0
    end

    def list_of_positions()
      @list_of_positions
    end

    def current_iteration()
      @current_iteration
    end

    
    # opens a FASTA file by passing the path as a String and saves the details 
    def open(filename)
      
      @filehandler = File.new(filename)
      
      list_of_positions = []
      pos = @filehandler.pos
      
      @filehandler.each do |entry|   
          if entry.include? ">"
            list_of_positions << pos
          end 
        pos = @filehandler.pos
      end

      @list_of_positions = list_of_positions


    end

    # This method returns the entry matching the current_iteration number
    def next()
      
      @filehandler.seek(@list_of_positions[@current_iteration], IO::SEEK_SET)
      
      entry = make_entry(@filehandler)

      if @list_of_positions.length > @current_iteration
          @current_iteration += 1
      else
         puts "No more entries left after this one!"
      end  

      return entry
    end

    # Now the actual iterator


    ## Helper Method: make_entry; Makes an Entry object to the current file-position
    def make_entry(f)
      
      header = f.readline
      
      sequence =[]
      f.each do |line|
        unless line.include? ">"
          sequence << line
        else
          break
        end
      end
      entry = Entry.new(header,sequence)

      entry.gi_num()
      entry.accession_num()
      return entry
    end

    ### --------- extra credit ----------- ###
    
    # returns x'th entry in the file
    def entry_num(x)
      
      if x < 1
        raise "Invalid entry number!"
      end

      if x > @list_of_positions.length()
        raise "There are only #{@list_of_positions.length} entries"
      end

      
      # 1-based
      x -= 1
      
      @filehandler.seek(@list_of_positions[x], IO::SEEK_SET)
      entry = make_entry(@filehandler)
    end

    # How many entries are in the file?
    def count()
      @list_of_positions.length
    end

    # Returns first entry
    def first()
      
      @filehandler.seek(@list_of_positions[0], IO::SEEK_SET)
      entry = make_entry(@filehandler)
    end

    # Returns last entry
    def last()
      @filehandler.seek(@list_of_positions[-1], IO::SEEK_SET)
      entry = make_entry(@filehandler)
    end

  end


  class Entry
    
    def initialize(header,sequence, gi_num=nil, accession_num=nil )
      # Header is ">XX|GGGGGGGG|XXX|AAAAAAAAAAA| ..."
      @header = header
      @gi_num = gi_num
      @accession = accession_num
      @sequence = sequence.join
    end

    def header()
      @header
    end

    # Setter and Getter methods
    attr_accessor:header
    attr_accessor:sequence

    # returns the GI number
    def gi_num()
      @gi ||=  @header[4..11] 
    end

    

    def gi_num=(gi)
      @gi = gi
    end
      
    
    # returns the accession number
    def accession_num()
      accession ||= @header[17..27] 
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
  
end