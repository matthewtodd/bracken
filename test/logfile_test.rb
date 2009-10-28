require File.join(File.dirname(__FILE__), 'test_helper')

class LogfileTest < Test::Unit::TestCase
  context '#stream' do
    setup do
      @logfile = Logfile.new(__FILE__, 5)
    end

    should 'return a selectable, killable IO object tailing the file' do
      reads, _, _ = IO.select([@logfile.stream], nil, nil, 0.2)

      stream = reads.first

      begin
        stream.gets.should == File.readlines(__FILE__)[-5]
      ensure
        stream.kill
      end
    end
  end
end
