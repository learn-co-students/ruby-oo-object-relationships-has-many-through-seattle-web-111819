class Customer #belongs_to_waiter
    attr_accessor :name, :age
    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end

    # a customer looks at all of the meals, and then select only the ones that belong to them
    def meals
        Meal.all.select {|m| m.customer == self}
    end

    # retrieve the waiters who served the customer's meals
    def waiters
        meals.map {|m| m.waiter}
    end
end