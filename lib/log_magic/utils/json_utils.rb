module LogMagic::JSONUtils
  def pretty_print_json(json)
    JSON.pretty_generate(parse_json(json))
    .gsub("\n", '<br>')
    .gsub(" ", '&nbsp;')
  end

  def parse_json(json)
    JSON.parse(json)
  end

  def query_hash
    JSON.parse(query_json)
  end
end
