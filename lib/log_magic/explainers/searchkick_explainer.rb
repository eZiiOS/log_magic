require 'rack'

class LogMagic::SearchkickExplainer
  attr_accessor :database_name

  def initialize
    @persistance_layer = ::LogMagic::PersistanceLayer.new
  end

  def start
    app = Proc.new do |env|
      uuid = env['PATH_INFO'][1..-1]
      body = @persistance_layer.retrieve_value(uuid)
      ['200', {'Content-Type' => 'text/html', 'Content-Length' => body.length.to_s}, [body]]
    end

    Rack::Handler::WEBrick.run app, Port: 7467
  end
end
