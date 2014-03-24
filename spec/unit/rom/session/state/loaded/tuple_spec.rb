require 'spec_helper'

describe ROM::Session::State::Loaded, '#tuple' do
  subject { object.tuple }

  let(:object) { described_class.new(loader) }
  let(:tuple)  { double('Tuple') }
  let(:loader) do
    double('Loader',
      :tuple => tuple
    )
  end

  it { should be(tuple) }

  it_should_behave_like 'an idempotent method'
end
