class Chore
  attr_reader :id,
              :household_id,
              :task_name,
              :description,
              :weight,
              :frequency,
              :outdoor,
              :id,
              :location

  def initialize(chore_hash)
    @household_id = chore_hash[:household_id]
    @task_name = chore_hash[:task_name]
    @description = chore_hash[:description]
    @weight = chore_hash[:weight]
    @frequency = chore_hash[:frequency]
    @outdoor = chore_hash[:outdoor]
    @id = chore_hash[:id].to_i
  end

  def location
    'Indoor'
    return 'Outdoor' if @outdoor == true
  end
end
