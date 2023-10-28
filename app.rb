require_relative 'label'
require_relative 'storedata'
require_relative 'loaddata'
require_relative 'modules/app_methods'
require_relative 'modules/input_taker'
require 'securerandom'
require 'date'

# This is the App class, which handles application logic.
class App
  def initialize
    @books = loadbook
    @music_albums = []
    @games = []
    @genres = []
    @labels = loadlabel
    @authors = []
  end

  include InputTaker
  include Methods

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
      exit_app
    else
      puts 'Invalid option'
    end
  end

  def exit_app
    store_label(@labels)
    store_books(@books)
    puts 'Goodbye!'
    exit
  end
end
