# frozen_string_literal: true

# Game class represents a specific type of item with additional properties.
class Game < Item
  attr_accessor :last_played_at

  def initialize(title, publish_date, last_played_at)
    super(genre, author, source, label, publish_date)
    @title = title
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Date.new.year - @last_played_at.year > 2)
  end
end
