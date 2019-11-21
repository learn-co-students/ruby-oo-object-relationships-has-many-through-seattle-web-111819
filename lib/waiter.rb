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

    # initializes a meal using the current Waiter instance, 
    # a provided Customer instance and a total and tip

    def new_meal(customer, total, tip)  
        Meal.new(self, customer, total, tip) 
    end

    # returns an Array of Meal instances associated with this waiter

    def meals
        Meal.all.select do |meal|
            meal.waiter == self 
        end
    end

    # returns the Customer instance associated with the meal that received the largest tip

    def best_tipper
        meals.max do |a, b|
            a.tip <=> b.tip 
        end.customer 
    end

    # def best_tipper
    #     best_meal = meals.max do |meal_a, meal_b|
    #         meal_a.tip <=> meal_b.tip
    #     end
    #     best_tipper.customer 
    # end


   
  end