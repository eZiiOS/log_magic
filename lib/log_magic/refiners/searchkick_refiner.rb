class LogMagic::SearchkickRefiner
  attr_accessor :lines

  def initialize
    @lines = []
  end

  def matches?
    lines.last =~ /Search[^c]*curl/
  end

  def output
    lines.last
  end
end
