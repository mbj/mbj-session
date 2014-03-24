require 'spec_helper'

describe ROM::Session::State::Loaded, '#object' do
  subject { object.object }

  let(:object) { described_class.new(loader) }
  let(:domain_object)  { double('Object') }

  let(:loader) do
    double('Loader',
      :object => domain_object
    )
  end

  it { should be(domain_object) }

  it_should_behave_like 'an idempotent method'
end
