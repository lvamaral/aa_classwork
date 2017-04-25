class Employee

  attr_reader :name, :title, :salary
  attr_accessor :boss

  def initialize(name , title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
    @boss.assign_employees(self) unless @boss.nil?
  end

  def bonus(multiplier)
    if self.is_a?(Manager)
      subordinates_salaries = 0

      self.employees.each do |employee|
        subordinates_salaries += employee.salary
      end
      subordinates_salaries * multiplier
    else
      self.salary * multiplier
    end
  end

  def collect_salaries
    return self.salary unless self.is_a?(Manager)
    salaries = []

    self.employees.each do |employee|
      if employee.is_a?(Manager)
        salaries += [employee.salary] + employee.collect_salaries
      else
        salaries << employee.salary
      end
    end

    salaries
  end

  def bonus(mult)
    if self.collect_salaries.is_a?(Array)
      self.collect_salaries.reduce(:+) * mult
    else
      self.collect_salaries * mult
    end
  end
end

class Manager < Employee

  attr_reader :employees

  def initialize(name , title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def assign_employees(subordinate)
    @employees << subordinate
  end
end






ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 12000, darren)
