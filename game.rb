require_relative 'item'

class Game < Item
  attr_accessor :last_played_at, :multiplayer, :title, :author

  def initialize(title, genre, last_played_at, multiplayer, author, source, label, publish_date)
    super(title, genre, author, source, label)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def can_be_archived?
    super && (Date.new.year - @last_played_at.year > 2)
  end

  # You can define a class method to add a game to a collection of games.
  def self.add_game(games, title, genre, last_played_at, multiplayer, author, source, label, publish_date)
    new_game = Game.new(title, genre, last_played_at, multiplayer, author, source, label, publish_date)
    games << new_game
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

  print 'Enter the author: '
  author = gets.chomp

  print 'Enter the source: '
  source = gets.chomp

  print 'Enter the label: '
  label = gets.chomp

  print 'Enter the publish date (YYYY-MM-DD): '
  publish_date = Date.parse(gets.chomp)

  Game.add_game(@games, title, genre, last_played_at, multiplayer, author, source, label, publish_date)
end

def list_games
  if @games.empty?
    puts "No games available."
  else
    puts "List of Games:"
    @games.each_with_index do |game, index|
      puts "#{index + 1}. Title: #{game.title}"
      puts "   Genre: #{game.genre}"
      puts "   Last Played Date: #{game.last_played_at}"
      puts "   Multiplayer: #{game.multiplayer ? 'Yes' : 'No'}"
      puts '------------------------------------'
    end
  end
end
