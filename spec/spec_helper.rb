require 'attribute_extensions'

root = File.expand_path('../../', __FILE__)

Dir["#{root}/spec/support/**/*.rb"].each { |file| require file }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'
end
