require 'spec_helper'

describe ROM::Session::State, '#identity' do
  subject { object.identity }

  let(:object)        { described_class.new(mapper, domain_object)             }
  let(:mapper)        { double('Mapper', :dumper => dumper)                      }
  let(:domain_object) { double('Domain Object')                                  }
  let(:dumper)        { double('Dumper', :identity => identity, :tuple => tuple) }
  let(:identity)      { double('Identity')                                       }
  let(:tuple)         { double('Tuple')                                          }

  it { should be(identity) }

  it_should_behave_like 'an idempotent method'
end

