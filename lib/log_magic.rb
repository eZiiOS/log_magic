require 'file-tail'

class LogMagic
  def initialize(log_file_name)
    @log_file_name = log_file_name
    @refiners = []
    add_searchkick_refiner
  end

  def initialize_listener
    @log_listener = LogListener.new(@log_file_name)
  end

  def start
    @log_listener.listen do |line|
      add_line_to_refiners(line)
      check_for_refiner_output do |output|
        puts output
      end
    end
  end

  def add_line_to_refiners(line)
    @refiners.each do |refiner|
      refiner.lines << line
    end
  end

  def check_for_refiner_output
    @refiners.any? do |refiner|
      if refiner.matches?
        yield refiner.output
      end
    end
  end

  def add_searchkick_refiner
    @refiners << SearchkickRefiner.new
  end
end


require 'log_magic/utils/json_utils'
require 'log_magic/log_listener'
require 'log_magic/refiners/searchkick_refiner'
require 'log_magic/printers/searchkick_printer'
