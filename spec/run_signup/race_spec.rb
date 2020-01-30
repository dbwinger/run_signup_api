require 'spec_helper'

describe RunSignup::Race do
  describe '#initialize' do
    subject { RunSignup::Race.new hash }
    let(:hash) { { raw: 'hash' } }

    it 'coerces hash values' do
      expect(RunSignup::Race).to receive(:coerce_hash_values).with(hash) { { coerced: 'values'} }

      expect(subject.to_h).to eq( { coerced: 'values' })
    end
  end

  describe '#coerce_value' do
    subject { RunSignup::Race.coerce_value value }

    {
      'T' => true,
      'F' => false,
      '1/2/2020 23:59' => '2020-01-02T23:59:00+00:00',
      '01/02/2020' => '2020-01-02',
      '1/2/2020' => '2020-01-02',
      [1,2,'T','F'] => [1,2,true,false],
      { a: 'T' } => { a: true },
      'abc' => 'abc'
    }.each do |original, coerced|
      context "when value is #{original}" do
        let(:value) { original }

        it { is_expected.to eq(coerced) }
      end
    end
  end

  describe '#coerce_hash_values' do
    subject { RunSignup::Race.coerce_hash_values hash }

    let(:hash) { { a: 'a value', b: { b1: 'b1 value' } } }

    it 'coerces all values' do
      expect(RunSignup::Race).to receive(:coerce_value).with('a value') { 'a coerced value' }
      expect(RunSignup::Race).to receive(:coerce_value).with({b1: 'b1 value' }) { {b1: 'b1 coerced value'} }

      expect(subject).to eq({ a: 'a coerced value', b: { b1: 'b1 coerced value'} })
    end
  end
end
