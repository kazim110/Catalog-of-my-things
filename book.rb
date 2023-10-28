require_relative 'item'

class Book < Item
  attr_reader :publisher, :cover_state, :publish_date

  # rubocop:disable Metrics/ParameterLists
  def initialize(
    genre,
    author,
    source,
    label,
    publish_date,
    publisher,
    cover_state
  )
    super(genre, author, source, label, publish_date)
    @publisher = publisher
    @cover_state = cover_state
    # rubocop:enable Metrics/ParameterLists
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
