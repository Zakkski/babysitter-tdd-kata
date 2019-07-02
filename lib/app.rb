require_relative 'router.rb'
require_relative 'family.rb'
familyA = Family.new(
  name: 'Family A',
  pay_periods: [
    {start: 5, end: 11, rate: 15},
    {start: 11, end: 4, rate: 20}
    ]);
familyB = Family.new(
  name: 'Family B',
  pay_periods: [
    {start: 5, end: 11, rate: 15},
    {start: 11, end: 4, rate: 20}
    ]);
familyC = Family.new(
  name: 'Family C',
  pay_periods: [
    {start: 5, end: 11, rate: 15},
    {start: 11, end: 4, rate: 20}
    ]);

router = Router.new(familyA: familyA, familyB: familyB, familyC: familyC)

router.run
