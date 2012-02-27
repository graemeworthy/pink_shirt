class PinkShirt
  class SAX::Links < SAX::Base
    TAGS = %(a)
    def start_a attrs
      @link_info = attrs
      link  = ""
      link += '"'
      link += "(#{attrs['class']}). " if attrs['class']
      @output << link
    end
    def end_a
      link  = ""
      link += " (#{@link_info['title']})" if @link_info['title']
      link += '"'
      link += ":#{@link_info['href']}"
      @output << link
    end
  end
end