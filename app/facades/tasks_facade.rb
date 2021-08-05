class TasksFacade
  def self.post_task(task_name, user)
    tasklist = TaskService.get_list(user)[:items].first
    TaskService.create_task(task_name, user, tasklist[:id])
  end
end