require_relative '../music_album'
require './label'
require './genre'
require './author'
require './source'

describe 'MusicAlbum' do
  context 'when creating a new MusicAlbum' do
    label = Label.new('label title', 'red')
    genre = Genre.new('Rock')
    author = Author.new('Elvis', 'Presley')
    source = Source.new('Old', 'Grey')
    publish_date = Date.new
    on_spotify = true

    let(:album) do
      MusicAlbum.new(
        genre,
        author,
        source,
        label,
        publish_date,
        on_spotify
      )
    end
    it 'includes all properties' do
      expect(album.genre).to eq(genre)
      expect(album.author).to eq(author)
      expect(album.source).to eq(source)
      expect(album.label).to eq(label)
      expect(album.publish_date).to eq(publish_date)
    end
  end
end
