require File.join(File.dirname(__FILE__), 'test_helper')

class LogfileFilterTest < Test::Unit::TestCase
  context '#match?' do
    setup do
      @line = 'Sep 30 13:11:39 frodo fetchmail[19159]: skipping message bob@example.org@pop.example.org:1 (51945 octets) (oversized) flushed'
    end

    should 'match a syslog-style service name' do
      Logfile::Filter.new('postfix').match?(@line).should == false
      Logfile::Filter.new('fetchmail').match?(@line).should == true
    end

    should 'match a syslog-style service name and filter by pattern' do
      Logfile::Filter.new('fetchmail', /reading message/).match?(@line).should == false
      Logfile::Filter.new('fetchmail', /skipping message/).match?(@line).should == true
    end
  end
end
