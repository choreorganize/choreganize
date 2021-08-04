class Chore
  attr_reader :id,
              :household_id,
              :task_name,
              :description,
              :weight,
              :frequency,
              :outdoor

  def initialize(attributes)
    @id = attributes[:id]
    @household_id = attributes[:household_id]
    @task_name = attributes[:task_name]
    @description = attributes[:description]
    @weight = attributes[:weight]
    @frequency = attributes[:frequency]
    @outdoor = attributes[:outdoor]
  end

  def location
    if @outdoor == true
      'Outdoor'
    else
      'Indoor'
    end
  end
end
