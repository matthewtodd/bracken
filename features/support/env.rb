require 'open4'
require 'pathname'
require 'tmpdir'

class WorkingDirectory
  PROJECT_ROOT = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..', '..')))

  attr_reader :working_directory
  attr_reader :standard_out

  def initialize
    @working_directory ||= Pathname.new(Dir.mktmpdir)
  end

  def write_to_file(path, contents)
    working_directory.join(path).open('w') { |file| file.write(contents) }
  end

  def run(command)
    Dir.chdir(working_directory) do
      @pid, @standard_in, @standard_out, @standard_error = Open4.popen4(rejigger_the_path(command))
    end
  end

  def terminate_last_run
    Process.kill('TERM', @pid) if @pid
    @pid            = nil
    @standard_in    = nil
    @standard_out   = nil
    @standard_error = nil
  end

  private

  def rejigger_the_path(command)
    "/usr/bin/env PATH='#{PROJECT_ROOT.join('bin')}:#{ENV['PATH']}' RUBYLIB='#{PROJECT_ROOT.join('lib')}' #{command}"
  end
end

World do
  WorkingDirectory.new
end

Before do
  working_directory.mkpath
end

After do
  terminate_last_run
  working_directory.rmtree
end
