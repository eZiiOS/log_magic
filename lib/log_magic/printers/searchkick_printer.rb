require 'json'

class LogMagic::SearchkickPrinter
  include ::LogMagic::JSONUtils

  def initialize(line)
    @line = line
  end

  def extract_query_json
    @line.match(/'.*'/)[0][1..-2]
  end

  def print
    pretty_print_json(extract_query_json)
  end
end