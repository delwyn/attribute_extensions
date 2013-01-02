module AttributeExtensions
  module Typecasting
    class IntegerTypecaster
      def call(value)
        value.to_i if value.respond_to?(:to_i)
      end
    end
  end
end
