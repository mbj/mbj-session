require 'spec_helper'

describe ROM::Session::State::Loaded, '#mapper' do
  subject { object.mapper }

  let(:object) { described_class.new(loader) }
  let(:mapper)  { double('Mapper') }
  let(:loader) do
    double('Loader',
      :mapper => mapper
    )
  end

  it { should be(mapper) }

  it_should_behave_like 'an idempotent method'
end
