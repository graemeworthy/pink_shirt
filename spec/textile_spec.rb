#read-specs.rb
require 'yaml'
require 'redcloth'

# TextileSpec
# =============
# the textile spec
# from
class TextileSpec
	SPECS_PATH = "./spec/textile-spec/"
	def initialize(subset = nil)
		@subset = subset
		@specs_path ||= SPECS_PATH
	end
	def index
		@index ||= TextileSpec::Index.new
	end

	def get_spec(name)
		file_name = index.list[name]['file']
		spec = TextileSpec::Spec.new(@specs_path + file_name)
		spec
	end

	def to_hash
		return @hash if @hash

		@hash = {}

		if @subset
		 names = [@subset]
		else
		 names = index.names
		end
		names.each {|name|
  			@hash[name] = get_spec(name).spec
		}
		@hash
	end

	def flat
		 TextileSpec::Flattener.new(to_hash).flat
	end
end

# TextileSpec::Index
# ==================
# functions for loading the index file of the textile spec
class TextileSpec::Index

    INDEX_FILE = "index.yaml"

	attr_accessor :version

	def initialize(specs_path = nil, index_file = nil)
		@specs_path = specs_path || TextileSpec::SPECS_PATH
		@index_file = index_file || INDEX_FILE
		@version = contents[:version]

	end
	def list
		@list ||= contents[:specs]
	end
	def contents
		return @contents if @contents

		index_file = File.read(@specs_path + @index_file)
		@contents = YAML::load(index_file)

		return @contents
	end

	def names
		list.keys
	end

end

class TextileSpec::Flattener
	attr_accessor :flat
	def initialize(hash)
		@flat = []
		@trail = []
		dive(hash)

	end
	def dive(hash)
     if hash['desc']
       name = @trail.join(" | ")
       @flat << hash.merge({:name => name})
       @trail = []
     else

 	   hash.each{|k, v|
 	   	@trail << k
 	   	dive(v)
 	   }
     end
	end
end

class TextileSpec::Spec
	attr_accessor :spec
	def initialize(file_name)
		@file_name = file_name
		@spec      = parse_file
	end
	def parse_file
		spec_file = File.read @file_name
		YAML::load(spec_file)
	end
end

