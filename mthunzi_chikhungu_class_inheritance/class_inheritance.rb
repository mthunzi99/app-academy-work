class Employee
    attr_reader :name, :title, :salary
    attr_accessor :boss

    def initialize(name, title, salary, boss)
        @name, @title, @salary = name, title, salary
        self.boss = boss
    end

    def boss=(boss)
        @boss = boss
        boss.add_subordinate(self) unless boss.nil?
    end

    def bonus(multiplier)
        @salary * multiplier
    end
end

class Manager < Employee
    attr_reader :subordinates

    def initialize(name, title, salary, boss = nil)
        super(name, title, salary, boss)
        @subordinates = []
    end

    def add_subordinate(employee)
        @subordinates << employee
    end

    def bonus(multiplier)
        total_bonus = 0

        @subordinates.each do |employee|
            if employee.is_a?(Manager)
                total_bonus += (employee.salary + employee.bonus(1))
           else
                total_bonus += employee.salary
           end
        end

        total_bonus *= multiplier
    end

end


ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

puts ned.bonus(5) # => 500_000
puts darren.bonus(4) # => 88_000
puts david.bonus(3) # => 30_000