class PinkShirt::Entities
  REPLACEMENTS = {
    8217 => "'", #single quote
    8216 => "'", #left single quote
    8220 => '"', #right double quote
    8221 => '"', #left double quote
    8211 => "-", #endash
    8212 => "--", #emdash
    8230 => "...", #ellipsis
    215  => "x", #times
    8242 => "'", #inch
    174  => "(r)", #registered trademark
    8482 => "(tm)", # trademark
    169  => "(c)", #copyright
  }


  def self.sanitize(string)
    string_chars =  string.unpack("U*")
    string_chars.map! {|x| REPLACEMENTS[x] ? REPLACEMENTS[x].unpack('U*') : x}
    string_chars.flatten
    string =  string_chars.flatten.pack('U*')
    string
  end

end