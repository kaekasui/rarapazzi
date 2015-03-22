require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Paparazzi
  class Application < Rails::Application
    config.generators do |g|
        g.template_engine :haml
        g.stylesheet_engine :sass
    end

    config.sass.preferred_syntax = :sass
    config.active_record.raise_in_transactional_callbacks = true
  end
end
