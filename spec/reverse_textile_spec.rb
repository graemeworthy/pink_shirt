require './spec/spec_helper'
require './spec/textile_spec'

describe 'the official textile spec' do
	describe "Page Layout" do
	examples = TextileSpec.new('Page Layout').flat

	examples.each do |example|
		it example['desc'], :input => example[:input] do
			expected = PinkShirt.new(example['output']).to_textile
			actual   = example['input']
			expected.should == actual
		end
	end
	end

	describe "Pagagraph Text" do
	examples = TextileSpec.new('Writing Paragraph Text').flat

	examples.each do |example|
		it example['desc'], :input => example[:input] do
			expected = PinkShirt.new(example['output']).to_textile
			actual   = example['input']
			expected.should == actual
		end
	end
	end

	describe "Phrase Modifiers" do
	examples = TextileSpec.new('Phrase modifiers').flat

	examples.each do |example|
		it example['desc'], :input => example[:input] do
			expected  = PinkShirt.new(example['output']).to_textile
			actual   = example['input']
			expected.should == actual
		end
	end
	end

    describe "Attributes" do
	examples = TextileSpec.new('Attributes').flat

	examples.each do |example|
		it example['desc'], :input => example[:input] do
			expected   = PinkShirt.new(example['output']).to_textile
			actual  = example['input']
			expected.should == actual
		end
	end
	end

	describe "HTML Integration and Escapement" do
	examples = TextileSpec.new('HTML Integration and Escapement').flat

	examples.each do |example|
		it example['desc'], :input => example[:input] do
			expected   = PinkShirt.new(example['output']).to_textile
			actual  = example['input']
			expected.should == actual
		end
	end
	end
end

