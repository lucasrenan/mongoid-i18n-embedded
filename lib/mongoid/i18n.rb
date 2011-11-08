require "mongoid"
require "mongoid/i18n/configuration"
require "mongoid/i18n/internationalized_data"

module Mongoid
	module I18n
		extend ActiveSupport::Concern

		included do
			Mongoid::I18n::InternationalizedData.generate(self)
			embeds_many :internationalized_data, :class_name => "#{self.name}::InternationalizedData"
      accepts_nested_attributes_for :internationalized_data

      after_initialize :generates_internationalized_data
		end

		class << self
			attr_reader :configuration
		end

		def self.setup
			@configuration = Mongoid::I18n::Configuration.new
			yield(@configuration)
		end

		module ClassMethods
			def internationalized_field(name, options = {})
        "#{self.name}::InternationalizedData".constantize.field name, options

        define_method(name) do
          i18n_data ||= self.internationalized_data.where(:language => ::I18n.locale.to_s).first
          i18n_data.nil? ? "" : i18n_data.send(name)
        end

        Mongoid::I18n.configuration.locales.each do |l|
          n = "#{name}_#{l.to_s.gsub('-', '_')}"
          define_method(n) do
            i18n_data ||= self.internationalized_data.where(:language => l.to_s).first
            i18n_data.nil? ? "" : i18n_data.send(name)
          end
        end
      end
		end

		module InstanceMethods
			def generates_internationalized_data
				Mongoid::I18n.configuration.locales.each do |l|
					internationalized_data.build(:language => l.to_s)
				end
			end
		end

	end
end