class Family
  attr_reader :name, :pay_periods

  def initialize(attributes = {})
    @name = attributes[:name]
    @pay_periods = attributes[:pay_periods].map{ |pay_period| process_times(pay_period) }
  end


  private

  def process_times(pay_period)
    pay_period[:start] = fix_time(pay_period[:start])
    pay_period[:end] = fix_time(pay_period[:end])
    pay_period
  end

  def fix_time(time)
    time < 5 ? time + 24 : time + 12
  end
end
