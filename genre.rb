class Genre
  attr_reader :name, :items

  def initialize(name)
    @id = rand(1..10_000)
    @name = name
    @items = []
  end

  # item: Item class object
  def add_item(item)
    @items.push(item)
  end
end
