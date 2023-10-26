require './book'

describe Book do
  context 'can_be_archived? method test' do
    it 'returns true if the parent returns true' do
      book1 = Book.new('publisher 1', 'good', Date.new(1990, 1, 1))
      expect(book1.can_be_archived?).to be true
    end

    it 'returns true if cover_state is bad' do
      book2 = Book.new('publisher2', 'bad', Date.new(2010, 10, 21))
      expect(book2.can_be_archived?).to be true
    end
  end
end
