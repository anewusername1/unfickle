module Unfickle
  extend Forwardable
  def set_const(key,value)
    @hash ||= {constants: {}}
    @hash[:constants][key.upcase.to_sym]=value
  end

  def const_missing(key)
    if(has_constant?(key))
      get_const(key)
    else
      super(key)
    end
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

  def has_constant?(key)
    @hash[:constants].keys.include?(key)
  end

  def clear_constants
    @hash = {constants: {}}
  end
end
