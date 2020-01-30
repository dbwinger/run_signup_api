require 'spec_helper'

describe RunSignup::Race do
  describe '#initialize' do
    subject { RunSignup::Race.new hash }
    let(:hash) { { raw: 'hash' } }

    it 'coerces hash values' do
      expect_any_instance_of(RunSignup::Race).to receive(:coerce_hash_values).with(hash) { { coerced: 'values'} }

      expect(subject.to_h).to eq( { coerced: 'values' })
    end
  end
end
