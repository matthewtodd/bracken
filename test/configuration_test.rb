require File.join(File.dirname(__FILE__), 'test_helper')

class ConfigurationTest < Test::Unit::TestCase
  context 'faking the filesystem' do
    setup    { FakeFS.activate! }
    teardown { FakeFS.deactivate! }

    context '#files' do
      should 'be empty when the configuration file specifies no files' do
        File.open('/etc/bracken.rb', 'w') { |file| file.write('') }
        Configuration.new.parse([]).files.should == []
      end

      should 'have the files specified in the configuration file' do
        File.open('/etc/bracken.rb', 'w') { |file| file.write('file "/var/log/syslog"') }
        Configuration.new.parse([]).files.map { |file| file.path }.should == ['/var/log/syslog']
      end
    end

    context '#streams' do
      should 'return the IO stream for each file' do
        File.open('/etc/bracken.rb', 'w') { |file| file.write('file "/var/log/syslog"') }

        configuration = Configuration.new.parse([])
        configuration.streams.should == configuration.files.map { |file| file.stream }
      end
    end
  end
end
