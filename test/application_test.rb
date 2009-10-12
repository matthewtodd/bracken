require File.join(File.dirname(__FILE__), 'test_helper')

class ApplicationTest < Test::Unit::TestCase
  context '.execute!' do
    setup do
      Application.execute!
    end

    before_should 'execute according to the current configuration mode' do
      mock.proxy(Configuration).new([]) do |configuration|
        mock.proxy(configuration).mode do |mode|
          mock.proxy(mode).execute!
        end
      end

      mock.proxy(Application).new([]) do |application|
        mock.proxy(application).execute!
      end
    end
  end
end
