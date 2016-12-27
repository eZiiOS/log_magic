require 'rack'

class LogMagic::ExplainerServer
  def start
    app = Proc.new do |env|
      body = "Hello, World!"
      ['200', {'Content-Type' => 'text/html', 'Content-Length' => body.length.to_s}, [body]]
    end

    Rack::Handler::WEBrick.run app, port: 7467
  end
end
