# To run this example:
#   RUBYOPT=rubygems ./bin/bracken -c examples/syslog.rb

path = '/Users/mtodd/Code/hcts-logfiles/syslog.0'
# path = '/var/log/syslog'

file(path) do
  on 'dovecot',      /pop3-login/
  on 'fetchmail',    /reading message/
  on 'fetchmail',    /skipping message/
  on 'postfix/smtp', /bounce/
  on 'pppd',         /peer authentication/
end
