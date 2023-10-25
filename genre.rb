class Genre
  attr_reader :name
  
  initialize(name)
    @id = Math.rand(1..10000)
    @name = name
    @items = []
  end

  def add_item(item) # item: Item class object 
    @items.push(item)
  end
end