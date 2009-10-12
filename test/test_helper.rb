require 'test/unit'

require 'rubygems'
require 'redgreen' if STDIN.tty?
require 'rr'
require 'shoulda'

bracken_lib_directory = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(bracken_lib_directory) unless $LOAD_PATH.include?(bracken_lib_directory)
require 'bracken/application'

class Test::Unit::TestCase
  include RR::Adapters::TestUnit
  include Bracken
end
