Given /^these are the contents of "([^\"]*)":$/ do |path, contents|
  create_file(path, contents)
end

When /^I run bracken (.*)$/ do |options|
  run_bracken(options)
end

When /^another process writes the following lines to "([^\"]*)":$/ do |path, contents|
  append_to_file(path, contents)
end

Then /^I should see the following in the bracken output:$/ do |expected|
  expect_output(expected)
end
