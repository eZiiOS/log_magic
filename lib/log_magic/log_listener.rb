class LogMagic::LogListener
  def initialize(log_file_name)
    @log_file_name = log_file_name
  end

  def listen
    File.open(@log_file_name) do |log|
      log.extend(File::Tail)
      log.interval = 1
      log.backward(1)
      log.tail { |line| yield line }
    end
  end
end
