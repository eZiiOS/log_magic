class LogMagic::SearchkickRefiner
  attr_accessor :lines

  def initialize
    @lines = []
  end

  def matches?
    lines.last =~ /Search[^c]*curl/
  end

  def output
    searchkick_printer = ::LogMagic::SearchkickPrinter.new(lines.last)
    searchkick_printer.print
  end
end
