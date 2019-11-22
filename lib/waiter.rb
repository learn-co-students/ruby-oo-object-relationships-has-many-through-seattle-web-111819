class Waiter
  @@all = []
  attr_reader :name, :exp
  def initialize(name, exp)
    @name = name
    @exp = exp
    @@all << self
  end
  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end

  def best_tipper
    Meal.all.sort_by {|meal| meal.tip}.last.customer
  end
end