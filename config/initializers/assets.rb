# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# asseteのjs追加分
Rails.application.config.assets.precompile += %w( img_prev.js )
Rails.application.config.assets.precompile += %w( photo_prev.js )
Rails.application.config.assets.precompile += %w( delighters.min.js )
Rails.application.config.assets.precompile += %w( jquery.jscroll.min.js )
Rails.application.config.assets.precompile += %w( page_scroll.js )