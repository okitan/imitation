require File.join(File.dirname(__FILE__), 'spec_helper')

describe 'Class which extends Imitation and defines AUTHORS' do
  before :all do
    instance_eval do
      class Data
        extend Imitation
        AUTHORS = []
      end
    end
  end

  it 'should respond author with AUTHORS.rand' do
    mock(Data::AUTHORS).rand
    Data.author
  end

  it 'should respond author? with AUTHORS.rand?' do
    mock(Data::AUTHORS).rand?
    Data.author?
  end

  it 'should respond authors with AUTHORS.subset' do
    mock(Data::AUTHORS).subset
    Data.authors
  end

  it 'should respond authors? with AUTHORS.subset' do
    mock(Data::AUTHORS).subset?
    Data.authors?
  end

  it 'should raise NameError when other methods called' do
    lambda { Data.hoge }.should raise_error(NameError)
  end
end

describe 'Class which extend Imitation and defines CARP(the same form both in the singular and in the plural)' do
  before :all do
    instance_eval do
      class Data
        extend Imitation
        CARP = []
      end
    end
  end
  
  it 'should respond carp with CARP.subset and not CARP.rand' do
    mock(Data::CARP).rand
    do_not_allow(Data::CARP).rand
    Data.carp
  end

  it 'should respond carp? with CARP.rand?' do
    mock(Data::CARP).rand?
    Data.carp?
  end

  it 'should raise NameError when other methods called' do
    lambda { Data.hoge }.should raise_error(NameError)
  end
end
