this_rakefile_uses_shoe = <<END
----------------------------------------
Please install Shoe:
gem sources --add http://gems.github.com
gem install matthewtodd-shoe
----------------------------------------
END

begin
  gem 'matthewtodd-shoe'
rescue Gem::LoadError
  abort this_rakefile_uses_shoe
else
  require 'shoe'
end

Shoe.tie('bracken', '0.1.0', 'TODO write a summary of bracken here.') do |spec|
  spec.add_development_dependency 'open4'
end
