# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bracken}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Todd"]
  s.date = %q{2009-10-28}
  s.default_executable = %q{bracken}
  s.email = %q{matthew.todd@gmail.com}
  s.executables = ["bracken"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["Rakefile", "bracken.gemspec", "README.rdoc", "bin/bracken", "examples/console.rb", "examples/syslog.rb", "examples/system.rb", "features/step_definitions", "features/step_definitions/bracken_steps.rb", "features/support", "features/support/env.rb", "features/tailing.feature", "lib/bracken", "lib/bracken/application.rb", "lib/bracken/configuration", "lib/bracken/configuration/builder.rb", "lib/bracken/configuration/options.rb", "lib/bracken/configuration.rb", "lib/bracken/logfile", "lib/bracken/logfile/filter.rb", "lib/bracken/logfile/stream.rb", "lib/bracken/logfile.rb", "lib/bracken.rb", "test/configuration_builder_test.rb", "test/configuration_options_test.rb", "test/configuration_test.rb", "test/logfile_filter_test.rb", "test/logfile_test.rb", "test/test_helper.rb"]
  s.rdoc_options = ["--main", "README.rdoc", "--title", "bracken-0.1.1", "--inline-source"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Bracken, at present, is a glorified logfile tailer.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoe>, [">= 0"])
      s.add_runtime_dependency(%q<open4>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<fakefs>, [">= 0"])
      s.add_development_dependency(%q<jeremymcanally-matchy>, [">= 0"])
      s.add_development_dependency(%q<redgreen>, [">= 0"])
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<shoe>, [">= 0"])
      s.add_dependency(%q<open4>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<fakefs>, [">= 0"])
      s.add_dependency(%q<jeremymcanally-matchy>, [">= 0"])
      s.add_dependency(%q<redgreen>, [">= 0"])
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoe>, [">= 0"])
    s.add_dependency(%q<open4>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<fakefs>, [">= 0"])
    s.add_dependency(%q<jeremymcanally-matchy>, [">= 0"])
    s.add_dependency(%q<redgreen>, [">= 0"])
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end
