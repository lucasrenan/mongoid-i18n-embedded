module MongoidI18nEmbedded
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    
    def copy_initializer
      copy_file 'mongoid_i18n_embedded.rb', 'config/initializers/mongoid_i18n_embedded.rb'
    end
  end
end
