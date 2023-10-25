require_relative 'item'

class MusicAlbum < Item
  initialize(
    genre,
    author,
    source,
    label,
    publish_date,
    on_spotify
  )
    super(genre, author, source, label, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify
  end
end