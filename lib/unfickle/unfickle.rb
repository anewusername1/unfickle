module Unfickle
  def Unfickle.add_item(key,value)
    @hash ||= {}
    @hash[key]=value
  end

  def Unfickle.const_missing(key)
    @hash[key]
  end

  def Unfickle.each
    @hash.each {|key,value| yield(key,value)}
  end

  def Unfickle.values
    @hash.values || []
  end

  def Unfickle.keys
    @hash.keys || []
  end

  def Unfickle.[](key)
    @hash[key]
  end
end

