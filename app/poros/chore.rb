class Chore
  attr_reader :household_id,
              :task_name,
              :description,
              :weight,
              :frequency,
              :outdoor,
              :id,
              :location

  def initialize(attributes)
    @household_id = attributes[:household_id]
    @task_name = attributes[:task_name]
    @description = attributes[:description]
    @weight = attributes[:weight]
    @frequency = attributes[:frequency]
    @outdoor = attributes[:outdoor]
    @id = attributes[:id]
  end

  def location
    if @outdoor == true
      'Outdoor'
    else
      'Indoor'
    end
  end
end
