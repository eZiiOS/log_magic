class LogMagic::SearchkickExplainer::DisMaxExplainerSection
  def initialize(query_json)
    @query_json = query_json
  end

  def matches?
    @query_json =~ /[^\w]dis_max[^\w]/
  end

  def explanation
    "Test"
  end
end
