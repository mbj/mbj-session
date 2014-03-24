require 'spec_helper'

describe ROM::Session::Operand::Update, '#old_tuple' do
  subject { object.old_tuple }

  let(:object) { described_class.new(state, old_tuple) }

  let(:identity)      { double('Identity')      }
  let(:domain_object) { double('Domain Object') }
  let(:tuple)         { double('Tuple')         }
  let(:old_tuple)     { double('Old Tuple')     }

  let(:state) do
    double('State',
      :tuple    => tuple,
      :object   => domain_object,
      :identity => identity
    )
  end

  it { should be(old_tuple) }

  it_should_behave_like 'an idempotent method'
end
