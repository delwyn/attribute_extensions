require 'active_support/core_ext'

require 'attribute_extensions/typecasting'
require 'attribute_extensions/version'

module AttributeExtensions

  def self.included(base)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods
    include Typecasting

    def attribute_reader(*names)
      options = names.extract_options!

      names.each do |name|
        define_method(name.to_sym) do
          instance_variable_set("@#{name}", options[:default]) unless instance_variable_defined?("@#{name}")
          instance_variable_get("@#{name}")
        end
      end
    end

    def attribute_writer(*names)
      options = names.extract_options!

      names.each do |name|
        define_method("#{name}=") do |value|
          instance_variable_set("@#{name}", self.class.typecast(value, options[:type]))
        end
      end
    end

    def attribute(*args)
      attribute_reader(*args)
      attribute_writer(*args)
    end
  end
end
