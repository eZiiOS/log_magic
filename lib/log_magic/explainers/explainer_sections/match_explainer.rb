class LogMagic::SearchkickExplainer::MatchExplainerSection
  include ::LogMagic::TemplatingUtils

  def initialize(query_json)
    @query_json = query_json
  end

  def matches?
    @query_json =~ /[^\w]match[^\w]/
  end

  def explanation
    rendered_template
  end

  def template_name
    'match.haml'
  end
end
