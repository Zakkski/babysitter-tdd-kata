require 'pry-byebug'

class Family
  attr_reader :name, :pay_periods

  def initialize(attributes = {})
    @name = attributes[:name]
    @pay_periods = attributes[:pay_periods].map{ |pay_period| process_times(pay_period) } unless attributes[:pay_periods].nil?
  end

  def calculate_pay(start_time, end_time)
    return -1 unless validate_times(start_time, end_time)
    start_time, end_time = fix_time(start_time), fix_time(end_time)
    total = 0
    (start_time...end_time).each do |time|
      pay_periods.each do |period|
        if time >= period[:start] && time < period[:end]
          total += period[:rate]
          break
        end
      end
    end
    total
  end


  private

  def validate_times(start_time, end_time)
    correct_range = in_range?(start_time) && in_range?(end_time)
    correct_formats = fix_time(start_time) < fix_time(end_time)
    correct_range && correct_formats
  end

  def process_times(pay_period)
    pay_period[:start] = fix_time(pay_period[:start])
    pay_period[:end] = fix_time(pay_period[:end])
    pay_period
  end

  def fix_time(time)
    time < 5 ? time + 24 : time + 12
  end

  def in_range?(time)
    time >= 1 && time <= 12
  end
end
