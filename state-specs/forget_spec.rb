require 'spec_helper'

describe DataMapper::State, '#forget' do
  subject { object.forget }

  let(:class_under_test) do
    Class.new(described_class) do
      def self.name; 'TestClass'; end
    end
  end


  let(:object)        { class_under_test.new(mapper, domain_object) }
  let(:mapper)        { DummyMapper.new                           }
  let(:domain_object) { DomainObject.new(:foo, :bar) }


  it 'should raise StateError' do
    expect { subject }.to raise_error(DataMapper::StateError, 'TestClass cannot be forgotten')
  end
end
