require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RubyRailsProject5ForSeason20162017
  class Application < Rails::Application
    GrapeSwaggerRails.options.url          = 'api/v1/swagger_doc'
    GrapeSwaggerRails.options.app_url      = '/'
    GrapeSwaggerRails.options.api_auth     = 'bearer'
    GrapeSwaggerRails.options.api_key_name = 'Authorization'
    GrapeSwaggerRails.options.api_key_type = 'header'

    config.action_dispatch.default_headers = {
        'Access-Control-Allow-Origin' => '*',
        'Access-Control-Request-Method' => '*'
    }

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any,
                      :methods => [:get, :post, :options]
      end
    end
  end
end
