require './spec/spec_helper'

describe 'PinkShirt against redcloth in reality' do

	examples = YAML::load(File.read('./spec/examples/basics.yaml'))

	examples.each do |heading, example|
		it "#{heading} #{example['desc']}" do
			html = RedCloth.new(example['textile']).to_html.chomp
			decoded  = PinkShirt.new(html).to_textile.to_s.chomp.chomp
			actual   = example['textile']
			decoded.should == actual
		end
	end

end
