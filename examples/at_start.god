God.at_start do
  require 'etc' unless defined?(Etc)
  File.chown(nil, Etc.getgrnam('staff').gid, God.server.socket_file)
  File.chmod(0770, God.server.socket_file)
end

God.watch do |w|

  w.name = "testing"
  w.interval = 5.seconds # default

  w.start = "#{Gem.ruby} -e 'loop do; end'"
  w.stop = "kill `cat #{w.pid_file}`"

end