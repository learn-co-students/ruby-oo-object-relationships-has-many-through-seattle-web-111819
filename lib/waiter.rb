class Waiter
attr_accessor :name, :yrs_experience
@@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    #initializes a meal using the current Customer instance, a provided Waiter instance and a total and tip

    Meal.new(self, customer, total, tip=0)
    
  end

  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end

  def best_tipper
    Meal.all.sort_by {|meal|meal.tip}.last.customer
  end

end