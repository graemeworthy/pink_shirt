class PinkShirt
  class SAX::Acronym < SAX::Base
    TAGS = %(acronym)

    def initialize(*args)
      @current_acronym = []
      super
    end

    def start_acronym attrs
      @current_acronym << attrs['title']
    end

    def end_acronym
      @output << "(#{@current_acronym.pop})"
    end
  end
end