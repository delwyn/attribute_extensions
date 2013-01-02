require 'spec_helper'

describe AttributeExtensions::Typecasting::DefaultTypecaster do
  it 'returns the value' do
    subject.call('value').should eq 'value'
  end
end
