require 'tmpdir'

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
