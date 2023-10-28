require './book'
require './label'
require './item'
require './genre'
require './author'
require './source'

describe Book do
  context 'can_be_archived? method test' do
    label = Label.new('label title', 'red')
    genre = Genre.new('Action')
    author = Author.new('Mary', 'Shelley')
    source = Source.new('Old', 'Grey')

    it 'returns true if the parent returns true' do
      book1 = Book.new(genre, author, source, label, Date.new(1990, 1, 1), 'publisher 1', 'good')
      expect(book1.can_be_archived?).to be true
    end

    it 'returns true if cover_state is bad' do
      book2 = Book.new(genre, author, source, label, Date.new(1990, 1, 1), 'publisher 1', 'bad')
      expect(book2.can_be_archived?).to be true
    end
  end
end
