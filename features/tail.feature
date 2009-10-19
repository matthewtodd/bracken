Feature: Tail
  In order to keep track of what's going on with the system
  As a system operator
  I want to simultaneously tail (and filter) a set of logfiles

  Scenario: Tailing
    Given these are the contents of "bracken.rb":
      """
      file 'syslog' do
        on 'fetchmail', /reading message ([^@]*?@[^@]*?)/ do |user|
          "fetched message for #{user}"
        end
      end
      """
    When I run bracken -c bracken.rb
    And another process writes the following lines to "syslog":
      """
      Sep 30 13:12:08 frodo fetchmail[19159]: reading message bob@example.org@pop.example.org:1 of 1 (4697 octets) flushed
      """
    Then I should see the following on standard out:
      """
      2009-09-30 13:12 -- fetched message for bob@example.org
      """
