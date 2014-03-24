require 'spec_helper'

describe ROM::Session::State, '#delete' do
  subject { object.delete }

  let(:object)        { described_class.new(mapper, domain_object)              }
  let(:mapper)        { double('Mapper', :dumper => dumper)                       }
  let(:dumper)        { double('Dumper', :tuple  => tuple, :identity => identity) }
  let(:identity)      { double('Identity')                                        }
  let(:tuple)         { double('Tuple')                                           }
  let(:domain_object) { double('Domain Object')                                   }

  let(:operand) do
    ROM::Session::Operand.new(ROM::Session::State.new(mapper, domain_object))
  end

  before do
    mapper.should_receive(:delete).with(operand)
  end

  it_should_behave_like 'a command method'
end

