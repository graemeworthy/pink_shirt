class PinkShirt
  class SAX::BoilerPlate < SAX::Base
    TAGS = %w(html body head)

    def start_html(attrs); end
    def end_html; end
    def start_body(attrs); end
    def end_body; end
    def start_head(attrs); end
    def end_head; end
  end
end
