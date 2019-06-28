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

end
