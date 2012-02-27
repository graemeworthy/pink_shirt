class PinkShirt::Attributes
  def self.write(attrs)
  end

  def initialize(attrs)
    @attrs = attrs
    @attrs_hash  = Hash[attrs]
    @styles_hash = parse_styles
    @nudges  = steal_nudges
    @padding = steal_padding
  end

  def attrs
    @attrs_hash
  end

  def styles
    @styles_hash ||= {}
  end


  def write
    add = []
    add << colspan
    add << rowspan
    add << nudges
    add << padding
    add << klass_and_id
    add << style
    add << lang
    out = add.join
    return nil if out == ""
    out
  end

  def parse_styles
    return nil unless attrs['style']
    rules_list = attrs['style'].split(";").map{|rule|
      rule.split(":")
    }
    Hash[rules_list]
  end

  def styles_to_s
    @styles_hash.map{|k, v| "#{k}:#{v}"}.join(";")
  end

  def steal_nudges

    return nil unless attrs['style']
    nudges = []
    style = attrs['style']

    text_align = case styles.delete('text-align')
    when 'left'
      "<"
    when 'right'
      ">"
    when 'center'
      "="
    when 'justify'
      "<>"
    end

    nudges << text_align

    nudges
  end

  def steal_padding

    return nil unless attrs['style']
    left = case styles.delete('padding-left')
    when '1em'; "(" ;
    when '2em'; "((";
    end

    #Alternately, but i'd rather not encourage it
    # left_count = styles.delete('padding-left').to_i
    # left = Array.new(left_count).map{"("}.join

    right = case styles.delete('padding-right')
    when '1em'; ")" ;
    when '2em'; "))";
    end

    padding = "#{left}#{right}"

  end

  def colspan
    return nil unless attrs['colspan']
    width = attrs['colspan']
    colspan = ""
    colspan << "\\" #literal backslash
    colspan << "#{width}"
    colspan if width
  end
  
  def rowspan
    return nil unless attrs['rowspan']
    height = attrs['rowspan']
    colspan = '/' + "#{height}" if height
  end
  
  def nudges
    @nudges
  end

  def padding
    @padding
  end
  

  def klass_and_id
    klass = attrs['class']
    id    = attrs['id']
    return nil unless klass || id
    output  = ""
    output += "("
    output += klass if klass
    output += "##{id}" if id
    output += ")"
  end

  def style
    return nil unless styles.length > 0

    output  = ""
    output += "{"
    output += styles_to_s
    output += "}"
  end

  def lang
    return nil unless attrs.include?('lang')
    output  = ""
    output += "["
    output += attrs['lang']
    output += "]"
  end
end
