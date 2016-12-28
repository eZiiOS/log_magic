class LogMagic::SearchkickExplainer::DisMaxExplainerSection
  include ::LogMagic::TemplatingUtils

  def initialize(query_json)
    @query_json = query_json
  end

  def matches?
    @query_json =~ /[^\w]dis_max[^\w]/
  end

  def explanation
    rendered_template
  end

  def template_name
    'dis_max.haml'
  end
end
