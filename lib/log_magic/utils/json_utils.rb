module LogMagic::JSONUtils
  def pretty_print_json(json)
    JSON.pretty_generate(parse_json(json))
  end

  def parse_json(json)
    JSON.parse(json)
  end
end
