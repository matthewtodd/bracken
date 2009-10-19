require File.join(File.dirname(__FILE__), 'test_helper')

class ConfigurationOptionsTest < Test::Unit::TestCase
  context 'options' do
    setup { @options = Configuration::Options.new }

    should 'default the configuration file to /etc/bracken.rb' do
      @options.parse(%w())
      @options.configuration_file.should == '/etc/bracken.rb'
    end

    should 'use the configuration file from -c' do
      @options.parse(%w(-c config.rb))
      @options.configuration_file.should == 'config.rb'
    end

    should 'use the configuration file from --config-file' do
      @options.parse(%w(--config-file config.rb))
      @options.configuration_file.should == 'config.rb'
    end
  end
end