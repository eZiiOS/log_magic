require 'redis'
require 'securerandom'

class LogMagic::PersistanceLayer
  attr_reader :uuid

  def initialize
    @redis = Redis.new
    @uuid = ::SecureRandom.uuid
  end

  def add_value(key, value)
    @redis.hset(@uuid, key, value)
  end

  def retrieve_value(uuid, key)
    @redis.hget(uuid, key)
  end
end
