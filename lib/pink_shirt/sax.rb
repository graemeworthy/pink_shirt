class PinkShirt::SAX < Nokogiri::XML::SAX::Document
  def initialize

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
    @msg = ""
  end

  def to_textile
    #@msg + "\n--\n" +
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
      raise StandardError, "unrecognised tag #{name}"
    end
    @running[klass]
  end

  def start_element name, attrs = []
    @msg += "start #{name} "
    attrs = Hash[attrs]
    get_processor(name).send("start_#{name}", attrs)
  end

  def end_element name
    @msg += "end #{name} "

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