Given /^these are the contents of "([^\"]*)":$/ do |path, contents|
  write_to_file(path, contents)
end

When /^another process appends "([^\"]*)" to "([^\"]*)"$/ do |contents, path|
  write_to_file(path, contents, 'a')
end

When /^another process renames "([^\"]*)" to "([^\"]*)"$/ do |old_path, new_path|
  rename_file(old_path, new_path)
end

When /^I run (.*)$/ do |command|
  run(command)
end

Then /^I should see "([^\"]*)" on standard out$/ do |expected|
  standard_out.gets.chomp.should == expected
end
