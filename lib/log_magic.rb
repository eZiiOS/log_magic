require 'file-tail'

class LogMagic
  def initialize(log_file_name)
    @log_file_name = log_file_name
  end

  def initialize_listener
    @log_listener = LogListener.new(@log_file_name)
  end

  def start
    @log_listener.listen do |line|
       puts line
    end
  end
end


require 'log_magic/log_listener'
