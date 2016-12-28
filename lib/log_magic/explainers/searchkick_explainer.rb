require 'rack'
require 'byebug'
require 'haml'

class LogMagic::SearchkickExplainer
  include ::LogMagic::JSONUtils
  include ::LogMagic::TemplatingUtils

  attr_accessor :database_name

  def initialize()
    @persistance_layer = ::LogMagic::PersistanceLayer.new
  end

  def query_json
    @persistance_layer.retrieve_value(@uuid)
  end

  def explainer_section_classes
    [
      DisMaxExplainerSection,
      BoostExplainerSection,
      MatchExplainerSection
    ]
  end

  def explainer_sections
    explainer_section_classes.map do |explainer_section_class|
      explainer_section_class.new(query_json)
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
                                    Logger: WEBrick::Log::new('/tmp/log_magic.log')
  end

  def template_name
    'searchkick.haml'
  end
end
