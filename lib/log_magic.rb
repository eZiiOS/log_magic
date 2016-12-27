require 'log_magic/log_listener'

class LogMagic
  def log_file_name=(log_file_name)
    @log_file_name = log_file_name
  end

  def initialize_listener
    @log_listener = LogListener.new(log_file_name)
  end

  def start
    @log_listener.listen do |file|
       puts file.gets # "Found it!" if f.gets =~ pattern
    end
  end
end
