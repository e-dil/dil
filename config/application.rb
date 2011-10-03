require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  Bundler.require *Rails.groups(:assets => %w(development test))
  # Bundler.require(:default, :assets, Rails.env)
end

module Dil
  class Application < Rails::Application
    # config.autoload_paths += %W(#{config.root}/extras)
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
    # config.time_zone = 'Central Time (US & Canada)'
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.assets.enabled = true
    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
  end
end
