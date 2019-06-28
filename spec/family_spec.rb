require_relative '../lib/family.rb'

familyA = Family.new(
  name: 'Family A',
  pay_periods: [
    {start: 5, end: 11, rate: 15},
    {start: 11, end: 4, rate: 20}
    ]);

describe 'Family' do
  it 'should have a class of "Family"' do
    Object.const_defined?('Family')
  end
end

describe '#name' do
  it 'should return the name of family' do
    expect(familyA).to respond_to :name
  end
end

describe '#pay_periods' do
  it 'should respond to pay_periods' do
    expect(familyA).to respond_to :pay_periods
  end

  it 'should normalize times to a 24 hour clock' do
    expect(familyA.pay_periods[0][:start]).to eq(17)
  end

  it 'should return the different pay periods of the family' do
    expect(familyA.pay_periods).to eq([
      {start: 17, end: 23, rate: 15},
      {start: 23, end: 28, rate: 20}
      ])
  end

  describe '#calculate_pay' do
    it 'should return take two numbers as arguments' do
      expect(familyA.method(:calculate_pay).arity).to eq 2
    end

    it 'should return a number' do
      expect(familyA.calculate_pay(5, 6)).to be_a Numeric
    end

    it 'should return 15 for one hour 5-6' do
      expect(familyA.calculate_pay(5, 6)).to eq 15
    end

    it 'should return 20 for one later hour 11-12' do
      expect(familyA.calculate_pay(11, 12)).to eq 20
    end

    it 'should calculate pay over multiple hours' do
      expect(familyA.calculate_pay(5, 9)).to eq 60
      expect(familyA.calculate_pay(11, 3)).to eq 80
    end

    it 'should calculate pay crossing over different pay periods' do
      expect(familyA.calculate_pay(8, 1)).to eq 85
      expect(familyA.calculate_pay(5, 4)).to eq 190
    end
  end
end
