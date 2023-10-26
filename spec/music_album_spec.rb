require_relative '../music_album.rb'

describe 'MusicAlbum' do
  context "when creating a new MusicAlbum" do
    genre = 'rock'
    author = 'RHCP'
    source = 'source'
    label = 'music'
    publish_date = Date.new
    on_spotify = true

    let(:album) { MusicAlbum.new(
      genre,
      author,
      source,
      label,
      publish_date,
      on_spotify
    ) }

    it 'includes a genre' do
      expect(album.genre).to eq(genre)
    end

    it 'includes an author' do
      expect(album.author).to eq(author)
    end

    it 'includes a source' do
      expect(album.source).to eq(source)
    end

    it 'includes a label' do
      expect(album.label).to eq(label)
    end

    it 'includes a date' do 
      expect(album.publish_date).to eq(publish_date)
    end
  end
end