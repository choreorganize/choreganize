class Chore
  attr_reader :household_id,
              :task_name,
              :description,
              :weight,
              :frequency,
              :outdoor,
              :id,
              :location

  def initialize(chore_hash)
    @household_id = chore_hash[:data][:attributes][:household_id].to_i
    @task_name = chore_hash[:data][:attributes][:task_name]
    @description = chore_hash[:data][:attributes][:description]
    @weight = chore_hash[:data][:attributes][:weight]
    @frequency = chore_hash[:data][:attributes][:frequency].to_i
    @outdoor = chore_hash[:data][:attributes][:outdoor]
    @id = chore_hash[:data][:id].to_i
  end

  def location
    'Indoor'
    return 'Outdoor' if @outdoor == true
  end
end
