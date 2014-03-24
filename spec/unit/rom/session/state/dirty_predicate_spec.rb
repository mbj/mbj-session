require 'spec_helper'

describe ROM::Session::State, '#dirty?' do
  subject { object.dirty?(old_state) }

  let(:object)        { described_class.new(mapper, domain_object)              }
  let(:mapper)        { double('Mapper', :dumper => dumper)                       }
  let(:dumper)        { double('Dumper', :tuple  => tuple, :identity => identity) }
  let(:identity)      { double('Identity')                                        }
  let(:tuple)         { double('Tuple')                                           }
  let(:domain_object) { double('Domain Object')                                   }
  let(:old_state)     { double('Old State', :tuple => old_tuple)                  }

  context 'when tuple equals old tuple' do
    let(:old_tuple) { tuple }

    it { should be(false) }

    it_should_behave_like 'an idempotent method'
  end

  context 'when tuple not equals old tuple' do
    let(:old_tuple) { double('Old Tuple') }

    it { should be(true) }

    it_should_behave_like 'an idempotent method'
  end
end

