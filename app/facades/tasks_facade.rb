class TasksFacade
  def self.post_task(task_name, user)
    require 'pry'; binding.pry
    tasklist = TaskService.get_list(user)[:items].first
    require 'pry'; binding.pry
    TaskService.create_task(task_name, user, tasklist[:id])
  end
end