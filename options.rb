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
      print "#{i}. #{el.name}"
    end
  end

  def list_labels(array)
    array.each_with_index do |el, i|
      print "#{i}. #{el.title}"
    end
  end

  def list_authors(array)
    array.each_with_index do |el, i|
      print "#{i}. #{el.first_name} #{el.last_name}"
    end
  end

  def add_music_album(app)
    print "1. Select a genre\n2. Add a new genre\n"
    print "Choose by number\n"
    select_genre = gets.chomp
    genre = nil
    case select_genre
    when '1'
      if app.genres.length > 0
        print "Select an option from the following:\n"
        list_genres(app.genres)
        option = gets.chomp
        genre = app.genres[option.to_i]
      else
        print "There are not any genres yet, please add a new one"
        return
      end
    when '2'
      print "Genre's name: "
      name = gets.chomp
      genre = Genre.new(name)
      app.genres.push(genre)
    else

    end

    author = nil
    print "1. Select an author\n2. Add a new author\n"
    print "Choose by number\n"
    select_author = gets.chomp
    case select_author
    when '1'
      if app.authors.length > 0
        print "Select an option from the following:\n"
        list_authors(app.authors)
        option = gets.chomp
        author = app["authors"][option.to_i]
      else
        print "There are not any authors yet, please add a new one"
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

    end

    label = nil
    print "1. Select a label\n2. Add a new label\n"
    print "Choose by number\n"
    select_label = gets.chomp
    case select_label
    when '1'
      if app.labels.length > 0
        print "Select an option from the following:\n"
        list_items(app.labels)
        option = gets.chomp
        label = app.labels[option.to_i]
      else
        print "There are not any labels yet, please add a new one"
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
    end

    print "Publish date: (yyyy-mm-dd)"
    publish_date = Date.parse(gets.chomp)

    print "On spotify? (y/n)"

    on_spotify = /y/i.match?(gets.chomp)

    print "Source: "
    source = gets.chomp
    new_album = MusicAlbum.new(genre, author, source, label, publish_date, on_spotify)
    app.music_albums.push(new_album)
    p app.music_albums
  end
end