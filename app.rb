# This is the App class, which handles application logic.
require_relative 'genre'
require_relative 'author'
require_relative 'label'
require_relative 'options'
require_relative 'music_album'
require_relative 'book'
require_relative 'game'
require_relative 'source'
require 'json'
require 'date'
require_relative 'modules/app_methods'
require_relative 'modules/input_taker'

class App
  attr_accessor(
    :books,
    :music_albums,
    :games,
    :genres,
    :labels,
    :authors,
    :sources
  )

  include Options
  include Methods
  include InputTaker

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = fetch_data('genres')
    @labels = fetch_data('labels')
    @authors = fetch_data('authors')
    @sources = fetch_data('sources')
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def create_objects(name, elem)
    author = nil
    genre = nil
    label = nil
    source = nil
    if /(music_albums|books|games)/.match?(name)
      p 'Sources length: ', @sources
      author = @authors.find { |aut| aut.id == elem['author_id'] }
      genre = @genres.find { |gen| gen.id == elem['genre_id'] }
      label = @labels.find { |lab| lab.id == elem['label_id'] }
      source = @sources.find { |src| src.id == elem['source_id'] }
    end
    case name
    when 'genres'
      Genre.new(elem['name'], elem['id'])
    when 'authors'
      Author.new(elem['first_name'], elem['last_name'], elem['id'])
    when 'labels'
      Label.new(elem['title'], elem['color'], elem['id'])
    when 'sources'
      Source.new(elem['name'], elem['id'])
    when 'games'
      Game.new(genre, author, source, label, elem['publish_date'], elem['last_played_at'], elem['multiplayer'],
               elem['title'])
    when 'books'
      Book.new(genre, author, source, label, elem['publish_date'], elem['publisher'], elem['cover_state'])
    when 'music_albums'
      MusicAlbum.new(genre, author, source, label, elem['publish_date'], elem['on_spotify'])
    end
    # rubocop:enable Metrics/CyclomaticComplexity
  end

  def fetch_data(name)
    path = "./storage/#{name}.json"
    if File.exist?(path)
      data = JSON.parse(File.read("./storage/#{name}.json"))
      data&.map do |el|
        create_objects(name, el)
      end
    else
      []
    end
  end

  def save_data_to_json(path, array)
    return if array.empty?

    data = array.map do |el|
      item = {}
      el.instance_variables.each do |key|
        prop_name = key.to_s.chars.slice(1, key.to_s.chars.length).join
        item[prop_name] = el.send(prop_name) unless prop_name == 'items'
      end
      item
    end

    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    File.write(path, JSON.generate(data, opts))
  end

  def save_items_to_json(path, array)
    return unless array.length.positive?

    p "Saving items to path: #{path}"
    data = array.map do |el|
      item = {}

      el.instance_variables.each do |key|
        prop_name = key.to_s.chars.slice(1, key.to_s.chars.length).join
        if /author|genre|label|source/.match?(prop_name)
          p "prop name: #{prop_name}"
          p "path: #{path}"
          item["#{prop_name}_id"] = el.send(prop_name).id
        else
          item[prop_name] = el.send(prop_name) unless prop_name == 'id'
        end
      end
      p "item: #{item}"
      item
    end

    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    File.write(path, JSON.generate(data, opts))
  end

  # checked
  def save_all_data
    save_items_to_json('./storage/books.json', @books)
    save_items_to_json('./storage/music_albums.json', @music_albums)
    save_items_to_json('./storage/games.json', @games)
    save_data_to_json('./storage/genres.json', @genres)
    save_data_to_json('./storage/labels.json', @labels)
    save_data_to_json('./storage/authors.json', @authors)
    save_data_to_json('./storage/sources.json', @sources)
  end

  def run(option) # rubocop:disable Metrics/CyclomaticComplexity
    @books = fetch_data('books') unless @books.length.positive?
    @games = fetch_data('games') unless @games.length.positive?
    @music_albums = fetch_data('music_albums') unless @music_albums.length.positive?
    case option
    when 1
      list_books
    when 2
      list_music_albums(music_albums)
    when 3
      list_games
    when 4
      list_genres(genres)
    when 5
      list_labels(labels)
    when 6
      list_authors(authors)
    when 7
      list_sources(self.sources)
    when 8
      add_book
    when 9
      add_music_album(self)
    when 10
      add_game(self)
    when 11
      saveAllData
      @music_albums.each {|el| print "#{el.author.first_name}" }
      exit
    else
      puts 'Invalid option'
    end
  end
end
