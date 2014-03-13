require 'date'

class Birthday
  attr_reader :birthdate

  def initialize(year, month, day)
    @birthdate = Date.new(year, month, day)
  end

  def age
    #not exact, assumes 365 days
    (Date.today - @birthdate).to_i / 365
  end

  def bash
    age.times do
      puts "punch"
    end
  end
end

simon = Birthday.new(1984,6,27)
simon.bash