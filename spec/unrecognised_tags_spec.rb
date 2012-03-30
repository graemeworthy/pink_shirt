require './spec/spec_helper'

describe 'Random and or namespaced tags' do
   it 'should not choke and die' do
      input = "<notextile>whatever</notextile>"
      Proc.new {PinkShirt.new(input).to_textile}.should_not raise_error
   end
end
