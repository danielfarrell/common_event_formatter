$:.unshift File.expand_path("../lib", __FILE__)
require "common_event_formatter"

Gem::Specification.new do |gem|
  gem.name     = "common_event_formatter"
  gem.version  = CommonEventFormatter::VERSION

  gem.author   = "Daniel Farrell"
  gem.email    = "danielfarrell76@gmail.com"
  gem.homepage = "http://github.com/danielfarrell/common_event_formatter"
  gem.summary  = "Format logs in the CEE/lumberjack structured format"

  gem.description = gem.summary

  gem.files = Dir["**/*"].select { |d| d =~ %r{^(README|lib/)} }

  gem.add_dependency 'json'

end
