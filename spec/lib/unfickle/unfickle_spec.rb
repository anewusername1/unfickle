require 'spec_helper'

describe Unfickle do
  subject do
    class TestClass
      include Unfickle
      extend Unfickle
    end
    TestClass
  end

  before(:each) do
    subject.clear
    subject.add_item(:BLAH, 'value')
  end


  describe '.add_item' do
    it "has a blah 'constant'" do
      subject.add_item(:YAHOO, 'sucks')
      subject::YAHOO.should == 'sucks'
    end
  end

  describe '.const_missing' do
    it 'just returns nil' do
      subject.const_missing(:YEEHAH).should == nil
    end
  end

  describe '.each' do
    it 'iterates over all the keys' do
      subject.each do |key, value|
        key.should == :BLAH
        value.should == 'value'
      end
    end
  end

  describe 'values' do
    context 'with values' do
      its(:values) { should == ['value'] }
    end

    context 'without values' do
      before(:each) { subject.clear }
      its(:values) { should == [] }
    end
  end

  describe 'keys' do
    context 'with keys' do
      its(:keys) { should == [:BLAH] }
    end

    context 'without keys' do
      before(:each) { subject.clear }
      its(:keys) { should == [] }
    end
  end

  describe '[]' do
    it 'response like an array' do
      subject[:BLAH].should == 'value'
    end
  end

  describe 'clear' do
    it 'clears the constants' do
      subject.clear
      subject.keys.should == []
    end
  end

end
