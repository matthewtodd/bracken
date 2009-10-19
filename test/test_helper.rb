require 'test/unit'

require 'rubygems'
require 'fakefs/safe'
require 'matchy'
require 'redgreen' if STDIN.tty?
require 'shoulda'

lib = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
$:.unshift(lib) unless $:.include?(lib)
require 'bracken'

class Test::Unit::TestCase
  include Bracken
end