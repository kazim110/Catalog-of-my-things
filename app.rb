# This is the App class, which handles application logic.
require_relative 'game'
class App
  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
  end

  def run(option) # rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity
    case option
    when 1
      list_books
    when 2
      list_music_albums
    when 3
      list_games
    when 4
      list_genres
    when 5
      list_labels
    when 6
      list_authors
    when 7
      add_book
    when 8
      add_music_album
    when 9
      add_game
    when 10
      exit
    else
      puts 'Invalid option'
    end
  end
end
