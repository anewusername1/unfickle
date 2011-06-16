module Unfickle
  def add_item(key,value)
    @hash ||= {}
    @hash[key]=value
  end

  def const_missing(key)
    @hash[key]
  end

  def each
    @hash.each {|key,value| yield(key,value)}
  end

  def values
    @hash.values || []
  end

  def keys
    @hash.keys || []
  end

  def [](key)
    @hash[key]
  end

  def clear
    @hash = {}
  end
end
