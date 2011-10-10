module Mongoid
	module I18n
		module InternationalizedData
			def self.generate(parent)
				obj = Class.new do
          include Mongoid::Document
          field :language
          embedded_in parent.name.downcase.to_sym, :inverse_of => :internationalized_data
        end
        parent.const_set(:InternationalizedData, obj)
			end
		end
	end
end