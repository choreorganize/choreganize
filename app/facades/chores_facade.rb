class ChoresFacade
  def self.create_chore(chore_info)
    chore_hash = ChoreService.create_or_find_chore(chore_info)
    Chore.new(chore_hash)
  end
end
