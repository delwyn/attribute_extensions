module AttributeExtensions
  module Typecasting
    class BooleanTypecaster
      TRUE_VALUES = [true, 1, "1", "t", "T", "true", "TRUE", "on", "ON"]

      def call(value)
        if value.is_a?(String) && value !~ /[^[:space:]]/
          nil
        else
          TRUE_VALUES.include?(value)
        end
      end
    end
  end
end
