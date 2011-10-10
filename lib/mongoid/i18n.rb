require "mongoid"
require "mongoid/i18n/configuration"
require "mongoid/i18n/internationalized_data"

module Mongoid
	module I18n
		extend ActiveSupport::Concern

		included do
			Mongoid::I18n::InternationalizedData.generate(self)
			embeds_many :internationalized_data, :class_name => "#{self.name}::InternationalizedData"
		end

		class << self
			attr_reader :configuration
		end

		def self.setup
			@configuration = Mongoid::I18n::Configuration.new
			yield(@configuration)
		end

		module ClassMethods
		end

		module InstanceMethods
		end
	end
end