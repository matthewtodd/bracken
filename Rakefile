begin
  require 'shoe'
rescue LoadError
  abort 'Please `gem install shoe` to get started.'
end

Shoe.tie('bracken', '0.0.0', 'Bracken, at present, is a glorified logfile tailer.') do |spec|
  spec.add_runtime_dependency 'open4'

  spec.add_development_dependency 'cucumber'
  spec.add_development_dependency 'fakefs'
  spec.add_development_dependency 'jeremymcanally-matchy'
  spec.add_development_dependency 'redgreen'
  spec.add_development_dependency 'thoughtbot-shoulda'
end
