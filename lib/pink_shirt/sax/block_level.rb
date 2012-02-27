class PinkShirt
  class SAX::BlockLevel < SAX::Base
    TAGS = %w(p br h1 h2 h3 h4 h5 h6 div blockquote)
    def start_p attrs
      @output << "p#{add_attributes(attrs)}. " if add_attributes(attrs)
    end

    def end_p
      @output << "\n\n"
    end

    def start_div attrs
      @output << "div#{add_attributes(attrs)}. "
    end

    def end_div
      @output << "\n"
    end

    def start_blockquote attrs
      if attrs['cite']
        @output << "bq.:#{attrs['cite']} "
      else
        @output << "bq#{add_attributes(attrs)}. "
      end
    end

    def start_br attrs
    end

    def end_br
      @output << "\n"
    end

    def start_h1 attrs
      @output << "h1#{add_attributes(attrs)}. "
    end

    def start_h2 attrs
      @output << "h2#{add_attributes(attrs)}. "
    end

    def start_h3 attrs
      @output << "h3#{add_attributes(attrs)}. "
    end

    def start_h4 attrs
      @output << "h4#{add_attributes(attrs)}. "
    end

    def start_h5 attrs
      @output << "h5#{add_attributes(attrs)}. "
    end

    def start_h6 attrs
      @output << "h6#{add_attributes(attrs)}. "
    end

    def end_h
      @output << "\n\n"
    end
    alias :end_h1 :end_h
    alias :end_h2 :end_h
    alias :end_h3 :end_h
    alias :end_h4 :end_h
    alias :end_h5 :end_h
    alias :end_h6 :end_h
  end
end
