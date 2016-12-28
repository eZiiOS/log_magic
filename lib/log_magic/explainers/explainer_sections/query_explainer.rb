class LogMagic::SearchkickExplainer::QueryExplainerSection
  include ::LogMagic::TemplatingUtils
  include ::LogMagic::JSONUtils
  attr_reader :query_json

  def initialize(query_json)
    @query_json = pretty_print_json(query_json)
    enriche_query_json
  end

  def explanation
    rendered_template
  end

  def template_name
    'query.haml'
  end

  def explainer_section_classes
    [
      ::LogMagic::SearchkickExplainer::DisMaxExplainerSection,
      ::LogMagic::SearchkickExplainer::BoostExplainerSection,
      ::LogMagic::SearchkickExplainer::MatchExplainerSection
    ]
  end

  def enriche_query_json
    explainer_section_classes.map do |explainer_section_class|
      explainer_section_class.new(query_json)
    end.select do |explainer_section|
      explainer_section.enriche
    end
  end
end
