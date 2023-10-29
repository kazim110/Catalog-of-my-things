class Genre
  attr_reader :name, :items, :id

  def initialize(name, id = rand(1..10_000))
    @id = id
    @name = name
    @items = []
  end

  # item: Item class object
  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
