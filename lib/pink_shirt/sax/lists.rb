class PinkShirt
  class SAX::Lists < SAX::Base
    TAGS = %w(ul ol li dl dt dd)
    def initialize(*args)
      @last_depth = 0
      @nesting = []
      super
    end
    def start_ul(attrs)
      @nesting.push "ul"
      @in_ul = true
      @output << "\n" unless @nesting.length == 1
    end

    def end_ul
      @nesting.pop
      @in_ul = false
    end

    def start_ol(attrs)
      @nesting.push('ol')
      @in_ol = true
      @output << "\n" unless @nesting.length == 1
    end

    def end_ol
      @nesting.pop
      @in_ol = false
    end

    def start_li(attrs)
      current_nest = @nesting.last
      if current_nest == "ol"
        chr = "#"
      else
        chr = "*"
      end
      @output << Array.new(@nesting.length).map{chr}.join + " "
    end

    def end_li
      @output << "\n" unless @last_depth > @nesting.length
      @last_depth = @nesting.length
    end

    def start_dl attrs
    end

    def end_dl
    end

    def start_dt attrs
      @output << "- "
    end

    def end_dt
    end

    def start_dd attrs
      @output << " := "
    end

    def end_dd
      @output << "\n"
    end
  end
end