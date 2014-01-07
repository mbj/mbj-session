require 'spec_helper'

describe ROM::Session::Operand, '#tuple' do
  subject { object.tuple }

  let(:object) { described_class.new(state) }

  let(:identity)      { mock('Identity')      }
  let(:domain_object) { mock('Domain Object') }
  let(:tuple)         { mock('Tuple')         }

  let(:state) do
    mock('State',
      :tuple    => tuple,
      :object   => domain_object,
      :identity => identity
    )
  end

  it { should be(tuple) }

  it_should_behave_like 'an idempotent method'
end
