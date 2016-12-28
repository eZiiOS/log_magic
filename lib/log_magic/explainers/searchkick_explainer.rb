require 'rack'
require 'byebug'
require 'haml'

class LogMagic::SearchkickExplainer
  include ::LogMagic::JSONUtils

  attr_accessor :database_name

  def initialize()
    @persistance_layer = ::LogMagic::PersistanceLayer.new
  end

  def query_json
    @persistance_layer.retrieve_value(@uuid)
  end

  def explainer_section_klasses
    [DisMaxExplainer]
  end

  def explainer_sections
    explainer_sections.map do |explainer_section_klass|
      explainer_section_klass.new(query_json)
    end.select do |explainer_section|
      explainer_section.matches?
    end
  end

  def start
    app = Proc.new do |env|
      @uuid = env['PATH_INFO'][1..-1]
      body = rendered_template

      ['200', {'Content-Type' => 'text/html', 'Content-Length' => body.length.to_s}, [body]]
    end

    Rack::Handler::WEBrick.run app, Port: 7467,
                                    Logger: WEBrick::Log::new('/dev/null')
  end

  def rendered_template

    engine = Haml::Engine.new(File.read(template_path))
    engine.render(self)
  end

  def template_path
    File.expand_path(
      File.join(__FILE__, '..', '..', 'explainer_templates', 'searchkick.haml')
    )
  end
end
