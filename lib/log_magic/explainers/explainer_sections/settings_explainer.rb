class LogMagic::SearchkickExplainer::SettingsExplainerSection
  include ::LogMagic::TemplatingUtils
  include ::LogMagic::JSONUtils
  attr_reader :elasticsearch_url

  def initialize(elasticsearch_url)
    @elasticsearch_url = elasticsearch_url
  end

  def index_settings
    `curl #{elasticsearch_url}/_settings`
  end

  def explanation
    rendered_template
  end

  def template_name
    'settings.haml'
  end
end
