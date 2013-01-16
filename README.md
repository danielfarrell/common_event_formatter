# CEE/Lumberjack log formatter for Ruby/Rails

Both [rsyslog](http://www.rsyslog.com/) and [syslog-ng](http://www.balabit.com/network-security/syslog-ng) support CEE in their latest versions. This allows you to format your Ruby/Rails logs in that format.

The envisioned use is to output your logs in CEE format to STDOUT and have your running environment pipe them to a logger command.

## Rails Example Config

Gemfile

    gem "common_event_formatter"

config/application.rb

    config.logger = Logger.new($stdout)
    config.logger.formatter = CommonEventFormatter.new

config/unicorn.rb (for those using unicorn)

    require "common_event_formatter"
    Configurator::DEFAULTS[:logger].formatter = CommonEventFormatter.new 
