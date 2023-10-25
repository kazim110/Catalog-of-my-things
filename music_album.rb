require_relative 'item'

class MusicAlbum < Item
  # rubocop:disable Metrics/ParameterLists
  def initialize(
    genre,
    author,
    source,
    label,
    publish_date,
    on_spotify
  )
    super(genre, author, source, label, publish_date)
    @on_spotify = on_spotify
    # rubocop:enable Metrics/ParameterLists
  end

  def can_be_archived?
    super && on_spotify
  end
end
