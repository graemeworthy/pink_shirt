class PinkShirt
  # SAX inherits from nokogiri's SAX::Document class
  # I'd recommend you visit nokogiri's documentation to learn more.
  # 
  # here's the gist.
  # each time the parser encounter's an opening tag it fires an event 'start_element'
  # each time the parser encounters a closing tag it fires an even 'end_element'
  #
  # I've segmented out the responsibilities over different tags to different classes
  # but the idea is that a class recieves a call to #start_html when <html> is reached
  # and a call to #end_html when </html> is reached, same for all the other tags
  #
  # each of the processors are classes that are responsible for a specific subset of tags
  
  
  class SAX < Nokogiri::XML::SAX::Document
    def initialize(fail_on_unknown=false)
      @fail_on_unknown = fail_on_unknown
      @processors = [
        PinkShirt::SAX::Basic,
        PinkShirt::SAX::BoilerPlate,
        PinkShirt::SAX::Lists,
        PinkShirt::SAX::Links,
        PinkShirt::SAX::Images,
        PinkShirt::SAX::BlockLevel,
        PinkShirt::SAX::Preformatted,
        PinkShirt::SAX::Tables,
        PinkShirt::SAX::Acronym,
        PinkShirt::SAX::Script
      ]
      @running ||= {}
      @output = PinkShirt::Output.new
      @flags  = PinkShirt::Flags.new
    end

    def to_textile
      @output.to_s
    end

    def get_processor(name)
      klass = @processors.find{|processor|
        processor::TAGS.include? name
      }
      return @running[klass] if @running[klass]
      if klass
        @running[klass] = klass.new(@output, @flags)
      else
        raise StandardError, "unrecognised tag #{name}" if @fail_on_unknown
      end
      @running[klass]
    end

    def start_element name, attrs = []
      attrs = Hash[attrs]
      get_processor(name).send("start_#{name}", attrs)
    end

    def end_element name
      get_processor(name).send("end_#{name}")

    end

    def characters(string)
      plaintext(string)
    end

    def plaintext(string)
      if @flags.pre == true
        @output << string
      else
        @output << string.gsub(/[\t\n]/, "")
      end
    end
  end
end
