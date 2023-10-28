# This is the App class, which handles application logic.
require_relative 'genre'
require_relative 'author'
require_relative 'label'
require_relative 'options'
require_relative 'music_album'
require_relative 'book'
require 'json'
require 'date'

class App
  attr_accessor(
    :books,
    :music_albums,
    :games,
    :genres,
    :labels,
    :authors
  )

  include Options

  def initialize
    @books = []
    @music_albums = []
    @games = []
    @genres = fetchData('genres')
    @labels = fetchData('labels')
    @authors = fetchData('authors')
  end

  def createObjects(name, el)
    author = nil
    genre = nil
    label = nil
    source = nil
    if /(music_albums|books|games)/.match?(name)
      author = @authors.find { |aut| aut.id == el['author_id'] }
      genre = @genres.find { |gen| gen.id == el['genre_id'] }
      label = @labels.find { |lab| lab.id == el['label_id'] }
      # source = @sources.find { |src| src.id == el.source_id }
    end
    case name
    when "genres"
      return Genre.new(el['name'], el['id'])
    when "authors"
      return Author.new(el['first_name'], el['last_name'], el['id'])
    when "labels"
      return Label.new(el['title'], el['color'], el['id'])
    when "source"
      # Pending code for creating Source class objects
    when "games"
      return Game.new(genre, author, source, label, el['publish_date'])
    when "books"
      return Book.new(genre, author, source, label, el['publish_date'], el['publisher'], el['cover_state'])
    when "music_albums"
      return MusicAlbum.new(genre, author, source, label, el['publish_date'], el['on_spotify'])
    else

    end
  end

  def fetchData(name)
    path = "./storage/#{name}.json"
    if File.exist?(path)
      data = JSON.parse(File.open("./storage/#{name}.json").read)
      if data
        array = data.map do |el|
          createObjects(name, el)
        end
        array
      end
    else
      []
    end
  end

  def saveDataToJSON(path, array)
    return if array.empty?
    data = array.map do |el|
      item = {}
      el.instance_variables.each do |key|
        prop_name = key.to_s.split('').slice(1, key.to_s.split('').length).join('')
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

  def saveItemsToJSON(path, array)
    return unless array.length > 0
    p "Saving items to path: #{path}"
    data = array.map do |el|
      item = {}

      el.instance_variables.each do |key|
        prop_name = key.to_s.split('').slice(1, key.to_s.split('').length).join('')
        if /author|genre|label/.match?(prop_name)
          p "prop name: #{prop_name}"
          p "path: #{path}"
          item[prop_name + "_id"] = el.send(prop_name).id
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

  def saveAllData # checked
    saveItemsToJSON('./storage/books.json', @books)
    saveItemsToJSON('./storage/music_albums.json', @music_albums)
    saveItemsToJSON('./storage/games.json', @games)
    saveDataToJSON('./storage/genres.json', @genres)
    saveDataToJSON('./storage/labels.json', @labels)
    saveDataToJSON('./storage/authors.json', @authors)
  end

  def run(option) # rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity
    @books = fetchData('books') unless @books.length > 0
    @games = fetchData('games') unless @games.length > 0
    @music_albums = fetchData('music_albums') unless @music_albums.length > 0
    case option
    when 1
      list_books
    when 2
      list_music_albums(self.music_albums)
    when 3
      list_games
    when 4
      list_genres(self.genres)
    when 5
      list_labels(self.labels)
    when 6
      list_authors(self.authors)
    when 7
      add_book
    when 8
      add_music_album(self)
    when 9
      add_game
    when 10
      saveAllData
      @music_albums.each {|el| print "#{el.author.first_name}" }
      exit
    else
      puts 'Invalid option'
    end
  end
end
