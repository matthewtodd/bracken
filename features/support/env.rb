require 'tmpdir'

# Even though I'm putting bracken's lib directory in the LOAD_PATH, it's only
# for the sake of require 'bracken/platform', helpful for getting a full path
# to the Bracken::BINARY I care about testing here. Otherwise, I think it's
# awesome (since bracken is a command-line app) to avoid touching any of the
# rest of the bracken code in these features.
bracken_lib_directory = File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'lib'))
$LOAD_PATH.unshift(bracken_lib_directory) unless $LOAD_PATH.include?(bracken_lib_directory)
require 'bracken/platform'

class BrackenWorld
  def working_directory
    @working_directory ||= Dir.mktmpdir('bracken-features')
  end

  def create_file(path, contents)
    write_to_file(path, contents, 'w')
  end

  def append_to_file(path, contents)
    write_to_file(path, contents, 'a')
  end

  def run_bracken(options)
    @pid = fork do
      in_working_directory do
        exec "#{Bracken::RUBY_BINARY} #{Bracken::BINARY} #{options} > #{output_path}"
      end
    end
  end

  def expect_output(expected)
    File.read(output_path).should == expected
  end

  def terminate_bracken_process
    Process.kill(Signal.list['TERM'], @pid)
  end

  private

  def write_to_file(path, contents, mode)
    in_working_directory { File.open(path, mode) { |file| file.write(contents) } }
  end

  def in_working_directory
    Dir.chdir(working_directory) { yield }
  end

  def output_path
    File.join(working_directory, 'BRACKEN_OUTPUT')
  end
end

World do
  BrackenWorld.new
end

Before do
  FileUtils.rm_rf working_directory
  FileUtils.mkdir working_directory
end

After do
  terminate_bracken_process
end
