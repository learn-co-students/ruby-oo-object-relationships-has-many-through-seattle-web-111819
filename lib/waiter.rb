class Waiter
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

    def meals
        Meal.all.select {|m| m.waiter == self}
    end

    def best_tipper
        meals.max {|meal_a, meal_b| meal_a.tip <=> meal_b.tip}.customer
    end
end