require_relative '../author'

RSpec.describe Author do
  let(:author) { Author.new('John', 'Doe') }

  it 'has a first name' do
    expect(author.first_name).to eq('John')
  end

  it 'has a last name' do
    expect(author.last_name).to eq('Doe')
  end

  it 'has an ID between 1 and 100' do
    expect(author.id).to be_between(1, 100).inclusive
  end

  it 'starts with an empty list of items' do
    expect(author.items).to be_empty
  end

  it 'can add an item' do
    item = Item.new('Example Item', 'Genre', 'Source', 'Label', '2023-01-01')
    author.add_item(item)
    expect(author.items).to include(item)
    expect(item.author).to eq(author)
  end
end
