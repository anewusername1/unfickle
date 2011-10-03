require 'spec_helper'

describe Unfickle do
  subject do
    class TestClass
    end
    TestClass
  end

  before(:each) do
    subject.clear_constants
    subject.set_const(:BLAH, 'value')
  end


  describe '.set_const' do
    it "has a blah 'constant'" do
      subject.set_const(:YAHOO, 'sucks')
      subject::YAHOO.should == 'sucks'
    end
  end

  describe '.const_missing' do
    context 'constant really is missing' do
      it 'just returns nil' do
        expect { subject.const_missing(:YEEHAH)}.to raise_error NameError, 'uninitialized constant TestClass::YEEHAH'
      end
    end

    context 'we have something in the hash' do
      it 'returns that something' do
        subject.const_missing(:BLAH).should == 'value'
      end
    end
  end

  describe '.clear_constants' do
    it 'clears the constants' do
      subject.clear_constants
      subject.constant_keys.should == []
    end
  end

  describe '.each_constant' do
    it 'iterates over all constants' do
      subject.each_constant do |key,value|
        key.should == :BLAH
        value.should == 'value'
      end
    end
  end

  describe '.constant_values' do
    it 'gets all values for the constants' do
      subject.constant_values.should == ['value']
    end
  end

  describe '.constant_keys' do
    it 'gets all keys for the constants' do
      subject.constant_keys.should == [:BLAH]
    end
  end

  describe '.get_const' do
    it 'grabs a single constant' do
      subject.get_const(:BLAH).should == 'value'
    end
  end

  describe '.has_constant?' do
    context 'it has' do
      it 'returns true' do
        subject.has_constant?(:BLAH).should == true
      end
    end

    context 'it has not' do
      it 'returns false' do
        subject.has_constant?(:BLAM).should == false
      end
    end
  end

end
