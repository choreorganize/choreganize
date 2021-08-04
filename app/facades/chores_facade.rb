class ChoresFacade
  def self.create_chore(chore_info)
    chore_attributes = ChoreService.create_or_find_chore(chore_info)
    formatted = chore_attributes[:data]
  
    Chore.new(formatted)
  end
end
