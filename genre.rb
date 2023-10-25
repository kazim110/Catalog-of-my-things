class Genre
  attr_reader :name

  def initialize(name)
    @id = Math.rand(1..10_000)
    @name = name
    @items = []
  end

  # item: Item class object
  def add_item(item)
    @items.push(item)
  end
end
