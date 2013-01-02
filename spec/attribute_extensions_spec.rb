require 'spec_helper'

describe AttributeExtensions do
  subject { model.new }

  describe 'attribute_reader' do
    let(:model) {
      Class.new do
        include AttributeExtensions

        attribute_reader :color
        attribute_reader :make, default: nil
        attribute_reader :gears,  default: 5
        attribute_reader :diesel, default: false
        attribute_reader :petrol, default: true
      end
    }

    its(:color)  { should eq nil}
    its(:make)   { should eq nil}
    its(:gears)  { should eq 5 }
    its(:diesel) { should be_false }
    its(:petrol) { should be_true }
  end

  describe 'attribute_writer' do
    let(:model) {
      Class.new do
        include AttributeExtensions

        attribute_writer :color
        attribute_writer :make,   type: :symbol
        attribute_writer :doors,  type: :integer
        attribute_writer :diesel, type: :boolean
        attribute_writer :tires,  type: Proc.new { |value| "proc: #{value}" }

        attr_reader :color, :make, :doors, :tires, :diesel
      end
    }

    it 'calls typecast with the value and type' do
      subject.class.should_receive(:typecast).with(1, :integer)
      subject.doors = 1
    end

    context 'integer' do
      before { subject.doors = '4' }

      its(:doors) { should eq 4 }
    end

    context 'symbol' do
      before { subject.make = 'audi' }

      its(:make) { should eq :audi }
    end

    context 'proc' do
      before { subject.tires = 'tires' }

      its(:tires) { should eq "proc: tires"}
    end

    context 'without type' do
      before { subject.color = 'blue' }

      its(:color) { should eq 'blue' }
    end

    describe 'boolean' do
      context 'when truthy' do
        before { subject.diesel = 't' }
        its(:diesel) { should be_true }
      end

      context 'when falsy' do
        before { subject.diesel = 'f' }
        its(:diesel) { should be_false }
      end
    end
  end

  describe 'attribute' do
    let(:model) {
      Class.new do
        include AttributeExtensions
      end
    }

    it 'creates a reader and a writer' do
      options = { type: :integer, default: 1 }
      model.should_receive(:attribute_reader).with(:name, options)
      model.should_receive(:attribute_writer).with(:name, options)
      model.send(:attribute, :name, options)
    end
  end
end
