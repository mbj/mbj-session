require 'spec_helper'

describe ROM::Session::Operand, '#identity' do
  subject { object.identity }

  let(:object) { described_class.new(state) }

  let(:identity)      { double('Identity')      }
  let(:domain_object) { double('Domain Object') }
  let(:tuple)         { double('Tuple')         }

  let(:state) do
    double('State',
      :tuple    => tuple,
      :object   => domain_object,
      :identity => identity
    )
  end

  it { should be(identity) }

  it_should_behave_like 'an idempotent method'
end
