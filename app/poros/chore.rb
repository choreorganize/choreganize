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

  # def initialize(attributes)
  #   require 'pry'; binding.pry
  #   @id = attributes[:id].to_i
  #   @household_id = attributes[:household_id]
  #   @task_name = attributes[:task_name]
  #   @description = attributes[:description]
  #   @weight = attributes[:weight]
  #   @frequency = attributes[:frequency]
  #   @outdoor = attributes[:outdoor]
  #   @id = attributes[:id]
  # end


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

  # def location
  #   if @outdoor == true
  #     'Outdoor'
  #   else
  #     'Indoor'
  #   end
  # end

  # def location
  #   if @outdoor == true
  #     'Outdoor'
  #   else
  #     'Indoor'
  #   end
  # end
end
