class LogMagic::SearchkickExplainer::MatchExplainerSection
  include ::LogMagic::TemplatingUtils

  def initialize(query_json)
    @query_json = query_json
  end

  def match_regex
    /[^\w]match[^\w]/
  end

  def template_name
    'match.haml'
  end
end
