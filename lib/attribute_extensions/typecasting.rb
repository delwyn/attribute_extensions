require 'attribute_extensions/typecasting/boolean_typecaster'
require 'attribute_extensions/typecasting/default_typecaster'
require 'attribute_extensions/typecasting/integer_typecaster'
require 'attribute_extensions/typecasting/symbol_typecaster'

module AttributeExtensions
  module Typecasting

    def typecast(value, type)
      if type.respond_to?(:call)
        type.call(value)
      else
        typecaster_for(type).call(value)
      end
    end

    def typecaster_for(type)
      type ||= :default

      typecaster = {
        boolean: Typecasting::BooleanTypecaster,
        integer: Typecasting::IntegerTypecaster,
        symbol:  Typecasting::SymbolTypecaster,
        default: Typecasting::DefaultTypecaster
      }[type]

      typecaster.new
    end
  end
end
