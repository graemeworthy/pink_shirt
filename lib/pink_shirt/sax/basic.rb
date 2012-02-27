class PinkShirt
  class SAX::Basic < SAX::Base
    TAGS = %w(strong b em i cite del ins sub sup span code)
    attr_accessor :nospan

    def start_strong attrs
      @output << "*"
      @output << add_attributes(attrs) if add_attributes(attrs)
    end

    alias :start_b :start_strong

    def end_strong
      @output << "*"
    end

    def start_b attrs
      @output << "**"
      @output << add_attributes(attrs) if add_attributes(attrs)
    end

    def end_b
      @output << "**"
    end

    def start_cite attrs
      @output << "??"
      @output << add_attributes(attrs) if add_attributes(attrs)
    end

    def end_cite
      @output << "??"
    end

    def start_em attrs
      @output << "_"
      @output << add_attributes(attrs) if add_attributes(attrs)
    end

    def end_em
      @output << "_"
    end

    def start_i attrs
      @output << "__"
      @output << add_attributes(attrs) if add_attributes(attrs)
    end

    def end_i
      @output << "__"
    end

    def start_del attrs
      @output << "-"
      @output << add_attributes(attrs) if add_attributes(attrs)
    end

    def end_del
      @output << "-"
    end

    def start_ins attrs
      @output << "+"
      @output << add_attributes(attrs) if add_attributes(attrs)
    end

    def end_ins
      @output << "+"
    end

    def start_sub attrs
      @output << "~"
      @output << add_attributes(attrs) if add_attributes(attrs)
    end

    def end_sub
      @output << "~"
    end

    def start_sup attrs
      @output << "^"
      @output << add_attributes(attrs) if add_attributes(attrs)
    end

    def end_sup
      @output << "^"
    end

    # redcloth loves to put caps in 'span-caps', it's lame
    def start_span attrs
      if attrs['class'] == 'caps'
        @nospan = true
      else
        @output << "%"
        @output << add_attributes(attrs) if add_attributes(attrs)
      end
    end

    def end_span
      @output << "%" unless @nospan
      @nospan = false
    end

    def start_code attrs
      @output << "@"
      @output << add_attributes(attrs) if add_attributes(attrs)
    end

    def end_code
      @output << "@"
    end

  end
end
