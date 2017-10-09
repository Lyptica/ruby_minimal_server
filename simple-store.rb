require 'webrick'

class Server
	def initialize()
		s = WEBrick::HTTPServer.new({:Port => '8080'})
		s.mount_proc('/') do |i,o|
			if i.path.include?('/save=')
				req = i.path.split('=')
				`echo #{req[1]} > save.txt`
				o.body = "saved: #{req[1]}"
			elsif i.path == '/load'
				f = File.open('save.txt')
				f.each_line do |v|
					o.body = "loaded: #{v}"
				end
			else
				o.body = i.path
			end
		end
		s.start
	end
end

Server.new()
