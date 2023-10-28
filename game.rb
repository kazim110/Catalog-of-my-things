require_relative 'item'
class Game < Item
  attr_accessor :last_played_at, :multiplayer, :title, :author
  def initialize(title, last_played_at, multiplayer, author, publish_date)
    super(title, nil, nil, nil, publish_date) # Pass nil for unused parameters
    @title = title
    @last_played_at = last_played_at
    @multiplayer = multiplayer
    @author = author
  end
  def can_be_archived?
    super && (Date.new.year - @last_played_at.year > 2)
  end
  # Use a hash to encapsulate the parameters
  def self.add_game(games, game_params)
    new_game = Game.new(game_params[:title], game_params[:last_played_at], game_params[:multiplayer],
                        game_params[:author], game_params[:publish_date])
    games << new_game
  end
end
def add_game
  print 'Enter the title of the game: '
  title = gets.chomp
  print 'Enter the last played date (YYYY-MM-DD): '
  last_played_at = Date.parse(gets.chomp)
  print 'Is the game multiplayer? (true/false): '
  multiplayer = gets.chomp.downcase == 'true'
  print 'Enter the author of the game: '
  author = gets.chomp
  print 'Enter the publish date (YYYY-MM-DD): '
  publish_date = Date.parse(gets.chomp)
  # Pass the parameters as a hash
  Game.add_game(@games, title: title, last_played_at: last_played_at, multiplayer: multiplayer, author: author,
                        publish_date: publish_date)
end
def list_games
  if @games.empty?
    puts 'No games available.'
  else
    puts 'List of Games:'
    @games.each_with_index do |game, index|
      puts "#{index + 1}. Title: #{game.title}"
      puts '------------------------------------'
    end
  end
end
