class Source
  attr_accessor :name, :items, :id

  def initialize(name, id = rand(1..10_000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
  end
end
