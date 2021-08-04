class Chore
  attr_reader :household_id,
              :task_name,
              :description,
              :weight,
              :frequency,
              :outdoor

  def initialize(attributes)
    @household_id = attributes[:household_id]
    @task_name = attributes[:task_name]
    @description = attributes[:description]
    @weight = attributes[:weight]
    @frequency = attributes[:frequency]
    @outdoor = attributes[:outdoor]
  end
end

{:data=>
  {:id=>"189", :type=>"chore", :attributes=>
    {:task_name=>"Mow Lawn",
     :household_id=>82,
     :description=>"Cut some grass, my friend.",
     :weight=>1,
     :frequency=>"weekly",
     :outdoor=>true,
     :household=>
      {:id=>82,
       :address=>"87022 Victor Summit",
       :password_digest=>"L5rIcKx27E0",
       :created_at=>"2021-08-02T22:59:01.512Z",
       :updated_at=>"2021-08-02T22:59:01.512Z",
       :city=>"denver",
       :state=>"co"}},
   :relationships=>{:household=>{:data=>{:id=>"82", :type=>"households"}}} }}
