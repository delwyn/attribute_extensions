require 'spec_helper'

describe AttributeExtensions::Typecasting::IntegerTypecaster do
  it 'returns the value.to_i if value responds to :to_i' do
    subject.call('1').should eq 1
  end

  it 'returns nil if value does not respond to :to_i' do
    subject.call(true).should be_nil
  end
end
