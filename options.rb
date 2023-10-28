# rubocop:disable Metrics/ModuleLength, Metrics/AbcSize
# rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
module Options
  def list_music_albums(array)
    array.each_with_index do |el, i|
      str = "#{i}. genre: #{el.genre.name} | "
      str += "#{el.author.first_name} #{el.author.last_name} | "
      str += "label: #{el.label.title} | color: #{el.label.color} | "
      str += "publish_date: #{el.publish_date}\n"
      print str
    end
  end

  def list_genres(array)
    array.each_with_index do |el, i|
      print "#{i}. #{el.name}\n"
    end
  end

  def list_labels(array)
    array.each_with_index do |el, i|
      print "#{i}. #{el.title}\n"
    end
  end

  def list_authors(array)
    array.each_with_index do |el, i|
      print "#{i}. #{el.first_name} #{el.last_name}\n"
    end
  end

  def add_music_album(app)
    print "1. Select a genre\n2. Add a new genre\n"
    print "Choose by number\n"
    select_genre = gets.chomp
    genre = nil
    case select_genre
    when '1'
      if app.genres.length.positive?
        list_genres(app.genres)
        print "\nSelect an option from the above:\n"
        option = gets.chomp
        genre = app.genres[option.to_i]
      else
        print 'There are not any genres yet, please add a new one'
        return
      end
    when '2'
      print "Genre's name: "
      name = gets.chomp
      genre = Genre.new(name)
      app.genres.push(genre)
    else
      print 'There are not any authors yet, please add a new one'
      return
    end

    author = nil
    print "1. Select an author\n2. Add a new author\n"
    print "Choose by number\n"
    select_author = gets.chomp
    case select_author
    when '1'
      if app.authors.length.positive?
        list_authors(app.authors)
        print "\nSelect an option from the above: "
        option = gets.chomp
        author = @authors[option.to_i]
      else
        print 'There are not any authors yet, please add a new one'
        return
      end
    when '2'
      print "Author's first name: "
      first_name = gets.chomp
      print "Author's last name: "
      last_name = gets.chomp
      author = Author.new(first_name, last_name)
      app.authors.push(author)
    else
      return
    end

    label = nil
    print "1. Select a label\n2. Add a new label\n"
    print "Choose by number\n"
    select_label = gets.chomp
    case select_label
    when '1'
      if app.labels.length.positive?
        list_labels(app.labels)
        print "\nSelect an option from the above: "
        option = gets.chomp
        label = app.labels[option.to_i]
        p "Label: #{label}"
      else
        print 'There are not any labels yet, please add a new one'
        return
      end
    when '2'
      print "label's title: "
      title = gets.chomp
      print "label's color: "
      color = gets.chomp
      label = Label.new(title, color)
      app.labels.push(label)
    else
      print "Invalid option, please try again\n"
      return
    end

    print 'Publish date: (yyyy-mm-dd)'
    publish_date = Date.parse(gets.chomp)

    print 'On spotify? (y/n)'

    on_spotify = /y/i.match?(gets.chomp)

    print 'Source: '
    source = Source.new(gets.chomp)
    app.sources.push(source)
    new_album = MusicAlbum.new(genre, author, source, label, publish_date, on_spotify)

    puts 'Debugging new album creation:'
    puts "Genre: #{new_album.genre.inspect}"
    puts "Author: #{new_album.author.inspect}"
    puts "Source: #{new_album.source}"
    puts "Label: #{new_album.label.inspect}"
    puts "Publish Date: #{new_album.publish_date}"
    puts "On Spotify: #{new_album.on_spotify}"

    app.music_albums.push(new_album)
  end

  def add_game(app)
    print "1. Select a genre\n2. Add a new genre\n"
    print "Choose by number\n"
    genre = nil
    select_genre = gets.chomp
    case select_genre
    when '1'
      if app.genres.length.positive?
        list_genres(app.genres)
        print "\nSelect an option from the above:\n"
        option = gets.chomp
        genre = app.genres[option.to_i]
      else
        print 'There are not any genres yet, please add a new one'
        return
      end
    when '2'
      print "Genre's name: "
      name = gets.chomp
      genre = Genre.new(name)
      app.genres.push(genre)
    else
      print 'There are not any genres yet, please add a new one'
      return
    end

    print 'Enter the title of the game: '
    game_title = gets.chomp

    print 'Enter the last played date (YYYY-MM-DD): '
    last_played_at = Date.parse(gets.chomp)

    print 'Is the game multiplayer? (true/false): '
    multiplayer = gets.chomp.downcase == 'true'

    author = nil
    print "1. Select an author\n2. Add a new author\n"
    print "Choose by number\n"
    select_author = gets.chomp
    case select_author
    when '1'
      if app.authors.length.positive?
        list_authors(app.authors)
        print "\nSelect an option from the above:\n"
        option = gets.chomp
        author = app.authors[option.to_i]
      else
        print 'There are not any authors yet, please add a new one'
        return
      end
    when '2'
      print "Author's first name: "
      first_name = gets.chomp
      print "Author's last name: "
      last_name = gets.chomp
      author = Author.new(first_name, last_name)
      app.authors.push(author)
    else
      return
    end

    print 'Enter the publish date (YYYY-MM-DD): '
    publish_date = Date.parse(gets.chomp)

    print 'Source: '
    source = Source.new(gets.chomp)
    app.sources.push(source)

    label = nil
    print "1. Select a label\n2. Add a new label\n"
    print "Choose by number\n"
    select_label = gets.chomp
    case select_label
    when '1'
      if app.labels.length.positive?
        list_labels(app.labels)
        print "\nSelect an option from the above: "
        option = gets.chomp
        label = app.labels[option.to_i]
        p "Label: #{label}"
      else
        print 'There are not any labels yet, please add a new one'
        return
      end
    when '2'
      print "label's title: "
      title = gets.chomp
      print "label's color: "
      color = gets.chomp
      label = Label.new(title, color)
      app.labels.push(label)
    else
      print "Invalid option, please try again\n"
      return
    end

    # Pass the parameters as a hash

    new_game = Game.new(genre, author, source, label, publish_date, last_played_at, multiplayer, game_title)
    app.games.push(new_game)
  end
end
# rubocop:enable Metrics/ModuleLength, Metrics/AbcSize
# rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
