module Unfickle
  extend Forwardable
  def set_const(key,value)
    @hash ||= {constants: {}}
    @hash[:constants][key.upcase.to_sym]=value
  end

  def const_missing(key)
    get_const(key)
  end

  def each_constant
    @hash[:constants].each {|key,value| yield(key,value)}
  end

  def constant_values
    @hash[:constants].values || []
  end

  def constant_keys
    @hash[:constants].keys || []
  end

  def get_const(key)
    @hash[:constants][key]
  end

  def clear_constants
    @hash = {constants: {}}
  end

  def each
    warn '.each method is deprecated in favor of .each_constant'
    warn "please remove your call to .each from #{caller.first}"
  end

  def values
    warn '.values method is deprecated in favor of .constant_values'
    warn "please remove your call to .values from #{caller.first}"
  end

  def keys
    warn '.keys method is deprecated in favor of .constant_keys'
    warn "please remove your call to .keys from #{caller.first}"
  end

  def clear
    warn '.clear method is deprecated in favor of .clear_constants'
    warn "please remove your call to .clear from #{caller.first}"
  end

  def [](key)
    warn '[] method is deprecated in favor of .get_const'
    warn "please remove your call to [] from #{caller.first}"
  end
end
