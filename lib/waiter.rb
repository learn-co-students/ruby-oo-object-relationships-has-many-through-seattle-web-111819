class Waiter #belongs_to_customer
    attr_accessor :name, :experience
    @@all = []

    def initialize(name, experience)
        @name = name
        @experience = experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    # the waiter gets all the meals they have served
    def meals
        Meal.all.select {|m| m.waiter == self}
    end

    def best_tipper
        meals.max {|meal_a, meal_b| meal_a.tip <=> meal_b.tip}.customer
    end
    # Used array from previous method (meals) as a helper method to retrieve all meals 
    # Used spaceship operator to compare customers' tips
    # Used .max to find the customer who gave the highest tip
end