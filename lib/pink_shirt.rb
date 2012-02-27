require 'nokogiri'


class PinkShirt
  def initialize(html)
    @html = html
    @sax_syntax = PinkShirt::SAX.new
    @parser     = Nokogiri::HTML::SAX::Parser.new(@sax_syntax)
  end

  def to_textile
    @parser.parse(@html)do |config|
      config.replace_entities = false
    end
    @sax_syntax.to_textile
  end
end

require "pink_shirt/version"
require 'pink_shirt/sax'
require 'pink_shirt/flags'
require 'pink_shirt/output'
require 'pink_shirt/entities'
require 'pink_shirt/attributes'
require 'pink_shirt/sax/base'
require 'pink_shirt/sax/basic'
require 'pink_shirt/sax/block_level'
require 'pink_shirt/sax/preformatted'
require 'pink_shirt/sax/lists'
require 'pink_shirt/sax/links'
require 'pink_shirt/sax/images'
require 'pink_shirt/sax/acronym'
require 'pink_shirt/sax/script'
require 'pink_shirt/sax/tables'
require 'pink_shirt/sax/boiler_plate'