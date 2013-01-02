module AttributeExtensions
  module Typecasting
    class SymbolTypecaster
      def call(value)
        value.to_sym if value.respond_to?(:to_sym)
      end
    end
  end
end
