require 'rbconfig'

module Bracken
  BINARY      = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'bin', 'bracken'))
  RUBY_BINARY = File.join(Config::CONFIG['bindir'], Config::CONFIG['ruby_install_name'])
end
