class LogMagic::SearchkickExplainer::BoostExplainerSection
  include ::LogMagic::TemplatingUtils

  def initialize(query_json)
    @query_json = query_json
  end

  def matches?
    @query_json =~ /[^\w]boost[^\w]/
  end

  def explanation
    rendered_template
  end

  def template_name
    'boost.haml'
  end
end
