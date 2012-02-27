class PinkShirt
  class SAX::Images < SAX::Base
    TAGS = %(img)
    def start_img attrs
      title   = attrs['alt'] || attrs['title']
      title   = nil if title == "" || title == " "
      image   = "!"
      image  += attrs['src']
      image  += "(#{title})" if title
      image  += "!"
      @output << image
    end
    def end_img

    end
  end
end