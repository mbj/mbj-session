require 'spec_helper'

describe ROM::Session::State::Loaded, '#identity' do
  subject { object.identity }

  let(:object) { described_class.new(loader) }
  let(:identity)  { double('Identity') }
  let(:loader) do
    double('Loader',
      :identity => identity
    )
  end

  it { should be(identity) }

  it_should_behave_like 'an idempotent method'
end
