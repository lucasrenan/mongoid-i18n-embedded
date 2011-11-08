require "spec_helper"

describe Mongoid::I18n do
	before do
		@locales = [:"pt-BR", :es]
		Mongoid::I18n.setup do |config|
			config.locales = @locales
		end
	end

	it "should provides configuration" do
		Mongoid::I18n.configuration.locales.should eq(@locales)
	end

	describe "InternationalizedData" do
		before do
			@post = Post.new			
		end

		it "should dynamically generates a InternationalizedData object" do
			@post.relation_exists?("internationalized_data").should be_true
			@post.relation_exists?("internationalized_data").first.class.should eq(Post::InternationalizedData)		
			@post.relations["internationalized_data"].name.should eq(:internationalized_data)
		end

		it "should generates InternationalizedData objects for each locale setted" do
			@post.internationalized_data.size.should eq(2)
			@post.internationalized_data.collect{|i| i.language.to_sym}.sort.should eq(@locales.sort)
		end

		it "should generates fields for InternationalizedData" do
			i = @post.internationalized_data.build

			i.fields.include?("title").should be_true
			i.fields.include?("text").should be_true
			i.respond_to?("title").should be_true
			i.respond_to?("text").should be_true
		end

    describe "locales" do
      before do 
        @post = Post.new
				# TODO refactor this approach for a better api
				@post.internationalized_data.where(:language => "pt-BR").first.title = "portuguese"
				@post.internationalized_data.where(:language => "es").first.title = "spanish"
				@post.save
      end
      
      it "should generate accessor for each locale" do
        @post.title_pt_BR.should eq("portuguese")
        @post.title_es.should eq("spanish")
      end
      
  		context "current locale" do
  			before do
  				::I18n.locale = :es
  			end

  			it "should return data related with current locale" do
  				@post.title.should eq("spanish")
  			end

  			context "changes" do
  				before do
  					::I18n.locale = "pt-BR"
  				end

  				it "should return data related with current locale" do					
  					@post.title.should eq("portuguese")
  				end
  			end
  		end
		end
		
	end

end