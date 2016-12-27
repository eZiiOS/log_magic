class LogMagic::LogListener
  def initialize(log_file_name)
    @log_file_name = log_file_name
  end

  def listen
    open_file
    seek_file_end

    while true
       select([@f])
       yield(@f)
    end
  end

  def open_file
    @f = File.open(file,"r") unless @f.present?
  end

  def seek_file_end
    @f.seek(0,IO::SEEK_END)
  end
end
