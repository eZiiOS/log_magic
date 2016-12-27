require 'redis'

class LogMagic::PersistanceLayer
  attr_accessor :db

  def initialize
    @redis = Redis.new
  end

  def add_value(value)
    uuid = SecureRandom.uuid

    @redis.set(uuid, value)

    return uuid
  end

  def retrieve_value(uuid)
    @redis.get(uuid)
  end
end
