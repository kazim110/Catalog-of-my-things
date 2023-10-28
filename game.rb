require_relative 'item'
class Game < Item
  attr_accessor :last_played_at, :multiplayer

  def initialize(title, publish_date, last_played_at, multiplayer)
    super(genre, author, source, label, publish_date)
    @title = title
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def can_be_archived?
    super && (Date.new.year - @last_played_at.year > 2)
  end
end

def add_game
  print 'Enter the title of the game: '
  title = gets.chomp

  print 'Enter the genre of the game: '
  genre = gets.chomp

  print 'Enter the last played date (YYYY-MM-DD): '
  last_played_at = Date.parse(gets.chomp)

  print 'Is the game multiplayer? (true/false): '
  multiplayer = gets.chomp.downcase == 'true'

  Game.add_game(@games, title, genre, last_played_at, multiplayer)
end
