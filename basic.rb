require 'webrick'

s = WEBrick::HTTPServer.new({
  :DocumentRoot => './',
  :BindAddress => 'localhost',
  :Port => 80
})

s.mount_proc('/') do |i,o|
  o.body = i.path
end

s.start