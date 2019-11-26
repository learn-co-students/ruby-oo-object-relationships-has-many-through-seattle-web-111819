class Meal #join, has_many_waiters_and_customers
    attr_accessor :waiter, :customer, :total, :tip
    @@all = []

    def initialize(waiter, customer, total, tip)
        @waiter = waiter
        @customer = customer
        @total = total
        @tip = tip
        @@all << self
    end

    def self.all
        @@all
    end
end