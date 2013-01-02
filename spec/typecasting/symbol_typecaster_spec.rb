require 'spec_helper'

describe AttributeExtensions::Typecasting::SymbolTypecaster do
  it 'returns the value.to_sym if value responds to :to_sym' do
    subject.call('sym').should eq :sym
  end

  it 'returns nil if value does not respond to :to_sym' do
    subject.call(true).should be_nil
  end
end
