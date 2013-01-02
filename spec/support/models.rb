class Car
  include AttributeExtensions

  # Attributes
  attribute :color
  attribute :automatic,  type: :boolean
  attribute :tires,      type: Proc.new { |value| "proc: #{value}" }

  # Attribute Readers
  attribute_reader :gears,  default: 5
  attribute_reader :diesel, default: false
  attribute_reader :petrol, default: true

  # Attribute Writers
  attribute_writer :doors,      type: :integer
  attribute_writer :make,       type: :symbol

  attr_reader :doors, :make
end
