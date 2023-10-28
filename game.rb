# Game class represents a specific type of item with additional properties.
class Game < Item
  attr_reader :title, :last_played_at, :multiplayer, :publish_date

  def initialize(genre, author, source, label, publish_date, title, last_played_at, multiplayer)
    super(genre, author, source, label, publish_date)
    @title = title
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def can_be_archived?
    super && (Date.new.year - @last_played_at.year > 2)
  end
end
