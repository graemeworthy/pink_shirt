class PinkShirt
  class SAX::Tables < SAX::Base
    TAGS = %w(table th tr td)

    def start_table attrs
       @output << "table#{add_attributes(attrs)}.\n" if add_attributes(attrs)
    end

    def end_table
    end

    def start_tr attrs
    end

    def end_tr
      @output << "|\n"
    end

    def start_th attrs
      @output << "|#{add_attributes(attrs)}_. "
    end

    def end_th
    end

    def start_td attrs
      if add_attributes(attrs)
        @output << "|#{add_attributes(attrs)}. "
      else
        @output << "|"
      end
    end

    def end_td
    end
  end
end