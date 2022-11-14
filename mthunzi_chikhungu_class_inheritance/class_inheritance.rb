class Employee
    attr_reader :name, :title, :boss
    attr_writer :salary

    def initialize(name, title, salary, boss = nil)
        @name, @title, @salary, @boss = name, title, salary, boss
    end

    def salary
        "$#{@salary}"
    end

end

class Manager < Employee

end


# ned.bonus(5) # => 500_000
# darren.bonus(4) # => 88_000
# david.bonus(3) # => 30_000