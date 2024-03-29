class Router

  def initialize(families = {})
    @familyA = families[:familyA]
    @familyB = families[:familyB]
    @familyC = families[:familyC]
    @active = true
  end


  def run
    puts `clear`
    while @active
      open_message
      family_id = gets.chomp.to_i
      family = get_family(family_id)
      unless family.nil?
        times = get_times
        payment = family.calculate_pay(times[0], times[1])
        payment_message(payment)
        continue_check
      else
        puts `clear`
        puts "Wrong input, Try Again"
      end

    end
  end

  private

  def payment_message(payment)
    if payment == -1
      puts "Inproper Times"
    else
      puts "You will make $#{payment}"
    end
  end

  def continue_check
    puts "Would you like to calculate again? (q to quit)"
    print ">"
    input = gets.chomp
    @active = false if input == 'q'
    puts `clear`
  end

  def get_family(id)
    case id
    when 1
      return @familyA
    when 2
      return @familyB
    when 3
      return @familyC
    else
      return nil
    end
  end

  def get_times
    times = []
    puts `clear`
    puts "Enter what time you start: "
    times << gets.chomp.to_i
    puts "Enter what time you end: "
    times << gets.chomp.to_i
    times
  end

  def open_message
    puts "Which family are you working for tonight?"
    puts "1. Family A"
    puts "2. Family B"
    puts "3. Family C"
    puts "Enter a number: "
  end
end
