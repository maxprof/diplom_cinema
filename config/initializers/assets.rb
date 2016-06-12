# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
# Rails.application.config.assets.precompile += %w( film_sessions.js )
# Rails.application.config.assets.precompile += %w( home.js )
# Rails.application.config.assets.precompile += %w( news.js )
# Rails.application.config.assets.precompile += %w( places.js )
# Rails.application.config.assets.precompile += %w( categories.js )
# Rails.application.config.assets.precompile += %w( cinemas.js )
# Rails.application.config.assets.precompile += %w( session_times.js )
# Rails.application.config.assets.precompile += %w( film_sessions.css )
# Rails.application.config.assets.precompile += %w( categories.css )
# Rails.application.config.assets.precompile += %w( cinemas.css )
# Rails.application.config.assets.precompile += %w( home.css )
# Rails.application.config.assets.precompile += %w( news.css )
# Rails.application.config.assets.precompile += %w( places.css )
# Rails.application.config.assets.precompile += %w( session_times.css )
# Rails.application.config.assets.precompile += %w( errors.css )







# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
%w( controller_one controller_two controller_three ).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js.coffee", "#{controller}.css"]
end
