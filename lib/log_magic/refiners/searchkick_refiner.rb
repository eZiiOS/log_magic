class LogMagic::SearchkickRefiner
  attr_accessor :lines

  def initialize
    @lines = []
  end

  def matches?
    lines.last =~ /Search[^c]*curl/
  end

  def compute(persistance_layer)
    query_json = extract_query_json
    uuid = persist(persistance_layer, query_json)
    output(query_json, uuid)
  end

  def output(query_json, uuid)
    searchkick_printer = ::LogMagic::SearchkickPrinter.new(query_json, uuid)
    searchkick_printer.print
  end

  def extract_query_json
    @lines.last.match(/'.*'/)[0][1..-2]
  end

  def persist(persistance_layer, query_json)
    persistance_layer.add_value(query_json)
  end
end
