class PinkShirt
  class SAX::Base
    TAGS = []
    def initialize(input, flags)
      @output = input
      @flags  = flags
    end

    def add_attributes(attrs)
      PinkShirt::Attributes.new(attrs).write
    end


    def to_s
      @output
    end

    def method_missing(*args)
    end
  end
end
