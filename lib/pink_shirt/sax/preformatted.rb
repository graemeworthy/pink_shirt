class PinkShirt
  
  class SAX::Preformatted < SAX::Base
    TAGS = %(pre)
    def start_pre attrs
      @flags.pre = true
      @output << "pre#{add_attributes(attrs)}. "
    end
    def end_pre
      @flags.pre = false
    end
  end
end
