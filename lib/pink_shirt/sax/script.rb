class PinkShirt
  class SAX::Script < SAX::Base
    TAGS = %(script)
    def start_script(attrs)
      @output.lock('script')
    end
    def end_script
      @output.unlock
    end
  end
end