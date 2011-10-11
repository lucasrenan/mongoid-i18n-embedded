require "spec_helper"

describe Mongoid::I18n do
	it "should provides configuration" do
		Mongoid::I18n.setup do |config|
			config.locales = [:"pt_BR", :es]
		end

		Mongoid::I18n.configuration.locales.should eq([:"pt_BR", :es])
	end

	context "InternationalizedData" do
		before do
			@post = Post.new
			@post.internationalized_data.build
		end

		it "should dynamically generates a InternationalizedData object" do
			@post.relation_exists?("internationalized_data").should_not be_false
			@post.relation_exists?("internationalized_data").first.class.should eq(Post::InternationalizedData)		
			@post.relations["internationalized_data"].name.should eq(:internationalized_data)
		end

		it "should generates fields for InternationalizedData" do
			i = @post.internationalized_data.build

			i.fields.include?("title").should be_true
			i.fields.include?("text").should be_true
			i.respond_to?("title").should be_true
			i.respond_to?("text").should be_true
		end
	end
end