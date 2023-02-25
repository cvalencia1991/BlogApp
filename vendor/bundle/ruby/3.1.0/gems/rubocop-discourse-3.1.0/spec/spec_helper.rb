# frozen_string_literal: true

require 'bundler/setup'
Bundler.setup

# Require supporting files exposed for testing.
require 'rubocop'
require 'rubocop/rspec/support'

require 'rubocop-discourse' # and any other gems you need

RSpec.configure do |config|
  config.include RuboCop::RSpec::ExpectOffense
  # some (optional) config here
end
