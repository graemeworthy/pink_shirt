I had a problem some html that needed to be textile.
I looked around at the available options, and none of them could get
back to exactly where you started.

This library still has some problems with whitespace management, but all
the tags convert.

It's based around https://github.com/textile/textile-spec
and built to produce mirror images of html produced by
RedCloth https://github.com/jgarber/redcloth

Usage
============================
text = "This is <em>my</em> text."
RedCloth.new(text).to_html


