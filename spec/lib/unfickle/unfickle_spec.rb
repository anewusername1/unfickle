require 'spec_helper'

describe Unfickle do
  subject do
    class TestClass
    end
    TestClass
  end

  before(:each) do
    subject.clear
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
        subject.const_missing(:YEEHAH).should == nil
      end
    end

    context 'we have something in the hash' do
      it 'returns that something' do
        subject.const_missing(:BLAH).should == 'value'
      end
    end
  end

  describe 'clear' do
    it 'clears the constants' do
      subject.clear
      subject.keys.should == []
    end
  end

end
