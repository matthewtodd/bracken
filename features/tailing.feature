Feature: Tailing
  In order to keep track of what's going on with the system
  As a system operator
  I want to simultaneously tail (and filter) a set of logfiles

  Scenario: Tailing an existing file with no filters or transformations
    Given these are the contents of "config.rb":
      """
      file 'syslog'
      """
    And these are the contents of "syslog":
      """
      Line One
      """
    When I run bracken -c config.rb
    Then I should see "Line One" on standard out
    When another process appends "Line Two" to "syslog"
    Then I should see "Line Two" on standard out

  Scenario: Tailing and filtering an existing file
    Given these are the contents of "config.rb":
      """
      file 'syslog' do
        on 'fetchmail', /reading message/
      end
      """
    And these are the contents of "syslog":
      """
      Sep 30 13:11:39 frodo fetchmail[19159]: skipping message bob@example.org@pop.example.org:1 (51945 octets) (oversized) flushed
      Sep 30 13:12:08 frodo fetchmail[19159]: reading message bob@example.org@pop.example.org:1 of 1 (4697 octets) flushed
      """
    When I run bracken -c config.rb
    Then I should see "Sep 30 13:12:08 frodo fetchmail[19159]: reading message bob@example.org@pop.example.org:1 of 1 (4697 octets) flushed" on standard out
