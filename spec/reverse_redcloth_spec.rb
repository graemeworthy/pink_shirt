require './spec/spec_helper'
require './spec/textile_spec'

describe 'do everything undo it, check it' do
	examples = TextileSpec.new().flat
	examples.each do |example|
		it example['desc'] do
		  original_input  = example['input']
		  original_output = example['output'] 
			generated_html   = RedCloth.new(example['input']).to_html
			generated_textile = PinkShirt.new(generated_html).to_textile
			
			generated_textile.should == original_input
		end
	end
end

