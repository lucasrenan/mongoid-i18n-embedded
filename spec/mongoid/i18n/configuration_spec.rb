require "spec_helper"

describe Mongoid::I18n::Configuration do
	it "should initialize with en" do
		configuration = Mongoid::I18n::Configuration.new
		configuration.locales.should eq([:en])
	end
end