class Recipe
  attr_reader :name, :description, :prep_time, :level, :done
  def initialize(name, description, prep_time, level)
    @name = name
    @description = description
    @prep_time = prep_time
    @level = level
    @done = false
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end
end
