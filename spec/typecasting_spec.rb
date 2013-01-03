require 'spec_helper'

describe AttributeExtensions::Typecasting do
  let(:model) {
    Class.new do
      include AttributeExtensions
    end
  }

  describe 'typecast' do
    context 'when type responds_to :call' do
      it 'sends :call with the value to the type' do
        proc = double
        proc.stub(:call).with(1).and_return 'some value'
        model.send(:typecast, 1, proc).should eq 'some value'
      end
    end

    context 'when type does not respond to call' do
      let(:typecaster) { AttributeExtensions::Typecasting::IntegerTypecaster.new }

      it 'sends :call with the value to the typecaster' do
        typecaster.should_receive(:call).with('1')
        model.should_receive(:typecaster_for).with(:boolean).and_return(typecaster)
        model.send(:typecast, '1', :boolean)
      end
    end
  end

  describe 'typecaster_for' do
    it 'returns a new instance of DefaultTypecaster when type is nil' do
      model.typecaster_for(nil).should be_an_instance_of(AttributeExtensions::Typecasting::DefaultTypecaster)
    end

    it 'returns a new instance of Typecaster that matches the type' do
      class AttributeExtensions::Typecasting::SomeTypeTypecaster; end

      model.typecaster_for(:some_type).should be_an_instance_of(AttributeExtensions::Typecasting::SomeTypeTypecaster)
    end
  end
end
