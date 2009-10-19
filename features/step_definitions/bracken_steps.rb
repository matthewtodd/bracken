Given /^these are the contents of "([^\"]*)":$/ do |path, contents|
  write_to_file(path, contents)
end

When /^I run (.*)$/ do |command|
  run(command)
end

Then /^I should see the following on standard out:$/ do |expected|
  standard_out.read.should include(expected)
end
