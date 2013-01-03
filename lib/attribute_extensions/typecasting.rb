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
      type = :default if type.nil?
      "AttributeExtensions::Typecasting::#{type.to_s.camelize}Typecaster".constantize.new
    end
  end
end
