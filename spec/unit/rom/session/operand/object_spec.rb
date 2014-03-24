require 'spec_helper'

describe ROM::Session::Operand, '#object' do
  subject { object.object }

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

  it { should be(domain_object) }

  it_should_behave_like 'an idempotent method'
end
