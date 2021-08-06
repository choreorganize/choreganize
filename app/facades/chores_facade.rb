class ChoresFacade
  def self.create_chore(chore_info)
    chore_attributes = ChoreService.create_or_find_chore(chore_info)
    formatted = chore_attributes[:data][:attributes]
    Chore.new(formatted)
  end

  def self.find_and_create_chore(id)
    chore_hash = ChoreService.find_by_id(id)
    Chore.new(chore_hash)
  end
end
