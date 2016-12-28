require 'minitest/autorun'
require 'log_magic'

class PersistanceLayerTest < Minitest::Test
  def setup
    @persistance_layer = LogMagic::PersistanceLayer.new
  end

  def test_can_store_hash_values
    assert @persistance_layer.add_value('key', '123')
  end

  def test_can_retrieve_hash_values
    uuid = @persistance_layer.add_value('key', '123')
    assert_equal @persistance_layer.retrieve_value(uuid, 'key'), '123'
  end
end
