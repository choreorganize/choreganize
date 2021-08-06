class ChoresFacade
  def self.find_and_create_chore(id)
    chore_hash = ChoreService.find_by_id(id)[:data]
    Chore.new(chore_hash[:attributes])
  end

  def self.find_nested_chore(id)
    chore_hash = ChoreService.find_by_id(id)[:data].first
    require 'pry'; binding.pry
    Chore.new(chore_hash[:attributes])
  end

  def self.create_chore(chore_info)

    chore_hash = {data: ChoreService.create_or_find_chore(chore_info)[:data].first}
    Chore.new(chore_hash)
  end
end
