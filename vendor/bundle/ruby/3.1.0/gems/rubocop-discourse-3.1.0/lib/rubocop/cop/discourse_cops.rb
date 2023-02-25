# frozen_string_literal: true

path = File.join(__dir__, "discourse", "*.rb")
Dir[path].each { |file| require file }
