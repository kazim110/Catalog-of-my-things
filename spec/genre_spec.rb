require_relative '../genre.rb'

describe 'Genre' do
  context "when running method 'add_item'" do
    let(:genre) { Genre.new('rock') }
    it "adds the given item to the array 'items' of the Genre object" do
      str = 'MockItem'
      genre.add_item(str)
      expect(genre.items[0]).to eq(str)
    end
  end
end