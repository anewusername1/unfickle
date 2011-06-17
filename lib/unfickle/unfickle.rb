module Unfickle
  extend Forwardable
  def set_const(key,value)
    @hash ||= {}
    @hash[key.upcase.to_sym]=value
  end

  def const_missing(key)
    @hash[key]
  end

  def_delegators :@hash, :each, :values, :keys, :[]

  def clear
    @hash = {}
  end
end
