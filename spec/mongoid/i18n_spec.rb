require "spec_helper"

describe Mongoid::I18n do
	it "should provides configuration" do
		Mongoid::I18n.setup do |config|
			config.locales = [:"pt_br", :es]
		end

		Mongoid::I18n.configuration.locales.should eq([:"pt_br", :es])
	end
end