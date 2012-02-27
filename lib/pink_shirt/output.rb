class PinkShirt

  ##
  # Nokogiri::Sax builds output as a long stream.
  # Output collects all the writes as an array, and then joins them when required
  # you can also lock it for writing.
  # 
  # = Usage
  # 
  #  stream = Output.new
  #  stream << 'goods... '
  #  stream.inspect #=> ['goods... ']
  #  stream.lock('suspicious tag')
  #  stream << 'bad stuff'
  #  stream.inspect #=> ['goods... ']
  #  stream.unlock
  #  stream << 'good again'
  #  stream.inspect #=> ['goods... ', 'good again']
  #

  class Output
    def initialize
      @contents = []
      @silenced = false
      @locks = []
      @ouput = ""
    end

    def lock(key)
      @locks << key
      @silenced = true
    end

    def unlock
      @locks.pop
      @silenced = false if @locks.empty?
    end

    def << (more)
      @contents << more unless @silenced
    end

    def join
      @output = @contents.join
    end

    def sanitize
      @output = PinkShirt::Entities.sanitize(@output)
    end

    def trim
      @output = @output.chomp.chomp.chomp
    end

    def to_s
      join
      sanitize
      trim
      @output
    end

    def inspect
      @contents
    end
  end
end
