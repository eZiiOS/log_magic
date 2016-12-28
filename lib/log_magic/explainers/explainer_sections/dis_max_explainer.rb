class LogMagic::SearchkickExplainer::DisMaxExplainerSection
  include ::LogMagic::TemplatingUtils

  def initialize(query_json)
    @query_json = query_json
  end

  def match_regex
    /[^\w]dis_max[^\w]/
  end

  def template_name
    'dis_max.haml'
  end
end
