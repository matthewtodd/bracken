require File.join(File.dirname(__FILE__), 'test_helper')

class ConfigurationBuilderTest < Test::Unit::TestCase
  context '#parse' do
    should "warn on standard error when configuration file doesn't exist" do
      error_stream  = StringIO.new('')

      builder = Configuration::Builder.new(nil, nil, error_stream)
      builder.parse('/does/not/exist')
      error_stream.rewind
      error_stream.read.should == "WARNING file /does/not/exist does not exist!\n"
    end
  end

  context '#file' do
    should 'add a new file into the configuration' do
      configuration = Configuration.new

      builder = Configuration::Builder.new(configuration)
      builder.file('/foo/bar')

      configuration.files.map { |file| file.path }.should == ['/foo/bar']
    end
  end

  context '#on' do
    should 'add a filter to the current file' do
      configuration = Configuration.new

      builder = Configuration::Builder.new(configuration)
      builder.file('/foo/bar') do
        on 'foo'
      end

      configuration.files.map { |file| file.filters }.should == [[Logfile::Filter.new('foo')]]
    end
  end
end