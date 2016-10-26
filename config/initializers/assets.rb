# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

#  config.assets.precompile = [ Proc.new { |path| 
#    puts path
#    !File.extname(path).in?(['.js', '.css']) 
# }, /(?:\/|\\|\A)application\.(css|js)$/ ]


# config.assets.precompile = [ Proc.new { |path| 
#    !File.extname(path).in?(['.js', '.css', '']) 
# }, /(?:\/|\\|\A)application\.(css|js)$/ ]

Rails.application.config.assets.precompile += %w( bootstrap/css/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( css/*.*.css )
Rails.application.config.assets.precompile += %w( css/*.css )
Rails.application.config.assets.precompile += %w( css/skins/skin-blue.css )
#Rails.application.config.assets.precompile += %w( build/less/header.less )
#Rails.application.config.assets.precompile += %w( build/*/*.less )



#Rails.application.config.less.paths << "#{Rails.root}/lib/less/protractor/stylesheets"
#Rails.application.config.less.compress = true

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
