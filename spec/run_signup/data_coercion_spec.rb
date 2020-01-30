require 'spec_helper'

class TestClass
  include RunSignup::DataCoercion
end

describe RunSignup::DataCoercion do
  let(:instance) { TestClass.new }

  describe '#coerce_value' do
    subject { instance.coerce_value value }

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
    subject { instance.coerce_hash_values hash }

    let(:hash) { { a: 'a value', b: { b1: 'b1 value' } } }

    it 'coerces all values' do
      expect(instance).to receive(:coerce_value).with('a value') { 'a coerced value' }
      expect(instance).to receive(:coerce_value).with({b1: 'b1 value' }) { {b1: 'b1 coerced value'} }

      expect(subject).to eq({ a: 'a coerced value', b: { b1: 'b1 coerced value'} })
    end
  end
end
