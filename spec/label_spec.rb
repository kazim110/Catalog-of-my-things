require './label'
require './item'

describe Label do
  context 'add_item method test' do
    label = Label.new('label title', 'red')
    item = Item.new('genre', 'author', 'source', label, Date.new(2010, 1, 1))
    label.add_item(item)

    it 'the label should be present in item' do
      compare = label == item.label
      expect(compare).to be true
    end

    it 'the item should be present in label' do
      compare = label.items[0] == item
      expect(compare).to be true
    end
  end
end
