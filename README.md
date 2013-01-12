# CEE/Lumberjack log formatter for Ruby/Rails

Treat your logs as the event stream they are.

## Rails Example Config

Gemfile

    gem "common_event_formatter"

config/application.rb

    config.logger = Logger.new($stdout)
    config.logger.formatter = CommonEventFormatter.new

config/unicorn.rb (for those using unicorn)

    require "common_event_formatter"
    Configurator::DEFAULTS[:logger].formatter = CommonEventFormatter.new 
