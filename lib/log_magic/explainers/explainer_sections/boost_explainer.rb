class LogMagic::SearchkickExplainer::BoostExplainerSection
  include ::LogMagic::TemplatingUtils

  def initialize(query_json)
    @query_json = query_json
  end

  def match_regex
     /[^\w]boost[^\w]/
  end

  def template_name
    'boost.haml'
  end
end
