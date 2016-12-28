require 'file-tail'

class LogMagic
  attr_reader :persistance_layer

  def initialize(log_file_name)
    @log_file_name = log_file_name
    @refiners = []
    @persistance_layer = PersistanceLayer.new
    add_searchkick_refiner
  end

  def database_name
    @persistance_layer.database_name
  end

  def initialize_listener
    @log_listener = LogListener.new(@log_file_name)
  end

  def start
    @log_listener.listen do |line|
      add_line_to_refiners(line)
      check_for_refiner_match do |refiner|
        puts refiner.compute(persistance_layer)
      end
    end
  end

  def add_line_to_refiners(line)
    @refiners.each do |refiner|
      refiner.lines << line
    end
  end

  def check_for_refiner_match
    @refiners.any? do |refiner|
      if refiner.matches?
        yield refiner
      end
    end
  end

  def add_searchkick_refiner
    @refiners << SearchkickRefiner.new
  end
end


require 'log_magic/utils/json_utils'
require 'log_magic/utils/templating_utils'
require 'log_magic/log_listener'
require 'log_magic/refiners/searchkick_refiner'
require 'log_magic/printers/searchkick_printer'
require 'log_magic/explainers/searchkick_explainer'
require 'log_magic/explainers/explainer_sections/dis_max_explainer'
require 'log_magic/explainers/explainer_sections/match_explainer'
require 'log_magic/explainers/explainer_sections/boost_explainer'
require 'log_magic/explainers/explainer_sections/settings_explainer'
require 'log_magic/explainers/explainer_sections/query_explainer'
require 'log_magic/persistance_layer'
