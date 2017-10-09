require 'webrick'

s = WEBrick::HTTPServer.new({:Port => '8080'})

s.mount_proc('/') do |i,o|
  o.body = i.path
end

s.start