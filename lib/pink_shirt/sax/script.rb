class PinkShirt
  # One does not textilize the contents of script tags, it is not done.
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