require "spec_helper"

describe Mongoid::I18n do
	it "should provides configuration" do
		Mongoid::I18n.setup do |config|
			config.locales = [:"pt_BR", :es]
		end

		Mongoid::I18n.configuration.locales.should eq([:"pt_BR", :es])
	end

	it "should dynamically generates a InternationalizedData object" do
		p = Post.new
		p.internationalized_data.build

		p.relation_exists?("internationalized_data").should_not be_false
		p.relation_exists?("internationalized_data").first.class.should eq(Post::InternationalizedData)		
		p.relations["internationalized_data"].name.should eq(:internationalized_data)
	end
end