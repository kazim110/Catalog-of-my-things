class Label
  attr_accessor :title, :color, :items, :id

  def initialize(title, color, id = rand(1..10_000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
