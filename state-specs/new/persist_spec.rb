require 'spec_helper'

describe DataMapper::State::New, '#persist' do
  let(:object)        { described_class.new(mapper, domain_object) }
  let(:mapper)        { DummyMapper.new                           }
  let(:domain_object) { DomainObject.new(:foo, :bar) }

  subject { object.persist }

  it 'should insert with mapper' do
    subject
    mapper.inserts.should == [:key_attribute => :foo, :other_attribute => :bar]
  end

  # Use Virtus::Value object to equalize on mapper and object?

  it 'should return loaded state' do
    state = subject
    state.should be_kind_of(DataMapper::State::Loaded)
    state.object.should be(domain_object)
    state.instance_variable_get(:@mapper).should be(mapper)
  end
end

