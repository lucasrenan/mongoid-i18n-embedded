class Post
	include Mongoid::Document
	include Mongoid::I18n

	internationalized_field :title
	internationalized_field :text

	validates_internationalized_fields :title
end