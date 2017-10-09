require 'webrick'

class Classify
  def initialize()
    s = WEBrick::HTTPServer.new({
      :DocumentRoot => './',
      :BindAddress => 'localhost',
      :Port => '8080'
    })
    s.mount_proc('/') do |i,o|
      o.body = meow(i.path)
    end
    s.start()
  end

  def meow(input)
    return "#{input} nyan nyan--^^"
  end
end
Classify.new()