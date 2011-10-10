require "mongoid"
require "mongoid/i18n/configuration"

module Mongoid
	module I18n
		class << self
			attr_reader :configuration
		end

		def self.setup
			@configuration = Mongoid::I18n::Configuration.new
			yield(@configuration)
		end
	end
end