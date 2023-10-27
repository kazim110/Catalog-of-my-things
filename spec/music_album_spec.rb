require_relative '../music_album'

describe 'MusicAlbum' do
  context 'when creating a new MusicAlbum' do
    genre = 'rock'
    author = 'RHCP'
    source = 'source'
    label = 'music'
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
