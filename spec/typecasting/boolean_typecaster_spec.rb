require 'spec_helper'

describe AttributeExtensions::Typecasting::BooleanTypecaster do
  it 'returns nil when blank string' do
    subject.call('').should be_nil
  end

  it 'returns false when value is not in TRUE_VALUES' do
    subject.call('falsy').should be_false
  end

  it 'returns true when value is in TRUE_VALUES' do
    expect{
      stub_const("AttributeExtensions::Typecasting::BooleanTypecaster::TRUE_VALUES", ['truthy'])
    }.to change{ subject.call('truthy') }.from(false).to(true)
  end
end
