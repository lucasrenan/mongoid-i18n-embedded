class Post
	include Mongoid::Document
	include Mongoid::I18n

	internationalized_field :title
	internationalized_field :text
end