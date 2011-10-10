module Mongoid
	module I18n
		class Configuration
			attr_accessor :locales

			def initialize
				@locales = [:en]
			end
		end
	end
end