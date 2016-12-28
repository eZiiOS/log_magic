class LogMagic::SearchkickRefiner
  attr_accessor :lines

  def initialize
    @lines = []
  end

  def matches?
    lines.last =~ /Search[^c]*curl/
  end

  def compute(persistance_layer)
    elasticsearch_url = extract_elasticsearch_url
    persist_elasticsearch_url(persistance_layer, elasticsearch_url)

    query_json = extract_query_json
    persist_query_json(persistance_layer, query_json)

    output(query_json, persistance_layer.uuid)
  end

  def output(query_json, uuid)
    searchkick_printer = ::LogMagic::SearchkickPrinter.new(query_json, uuid)
    searchkick_printer.print
  end

  def extract_query_json
    @lines.last.match(/'.*'/)[0][1..-2]
  end

  def extract_elasticsearch_url
    @lines.last.match(/https?:\/\/[^\/]*\/[^\/]*/)[0]
  end

  def persist_query_json(persistance_layer, query_json)
    persistance_layer.add_value('query_json', query_json)
  end

  def persist_elasticsearch_url(persistance_layer, elasticsearch_url)
    persistance_layer.add_value('elasticsearch_url', elasticsearch_url)
  end
end
