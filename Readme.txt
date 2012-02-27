I had a problem: some html needed to be textile

None of the available options could get back to exactly where you started.
They weren't 'reversable'

I learned a lot by reading other's who went before.
I've looked at: html2texile https://github.com/thickpaddy/html2textile
I've looked at: clothred https://github.com/CynicalRyan/ClothRed
I've looked at: a deeply buried module in humpyard https://github.com/humpyard/humpyard

This library still has some problems with whitespace management, but all the tags convert.

It's based around https://github.com/textile/textile-spec
and built to produce mirror images of html produced by
RedCloth https://github.com/jgarber/redcloth

Usage
============================
text = "This is <em>my</em> text."
RedCloth.new(text).to_html



