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

    should 'default the number of lines to 1000' do
      @options.parse(%w())
      @options.number_of_lines.should == 1000
    end

    should 'use the number of lines from -n' do
      @options.parse(%w(-n 10))
      @options.number_of_lines.should == 10
    end

    should 'use the number of lines from --lines' do
      @options.parse(%w(--lines 10))
      @options.number_of_lines.should == 10
    end

    should 'require a number for number of lines' do
      lambda {
        @options.parse(%w(--lines a))
      }.should raise_error(OptionParser::InvalidArgument)
    end
  end
end