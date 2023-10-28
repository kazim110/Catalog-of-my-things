module InputTaker
  def book_inputs
    print 'publisher: '
    publisher = gets.chomp.to_s
    print 'cover_state: '
    cover_state = gets.chomp.to_s.downcase
    print 'published_date(YYYY-MM-DD): '
    published_date = gets.chomp.to_s
    print "1. Select a genre\n2. Add a new genre\n"
    print "Choose by number\n"

    genre = nil
    select_genre = gets.chomp
    case select_genre
    when '1'
      if @genres.length.positive?
        print "Select an option from the following:\n"
        list_genres(@genres)
        option = gets.chomp
        genre = @genres[option.to_i]
      else
        print 'There are not any genres yet, please add a new one'
        return
      end
    when '2'
      print "Genre's name: "
      name = gets.chomp
      genre = Genre.new(name)
      @genres << genre
    else
      print 'There are not any genres yet, please add a new one'
      return
    end

    author = nil
    print "1. Select an author\n2. Add a new author\n"
    print "Choose by number\n"
    select_author = gets.chomp
    case select_author
    when '1'
      if @authors.length.positive?
        print "Select an option from the following:\n"
        list_authors(@authors)
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
      @authors << author
    else
      return
    end

    label = nil
    print "1. Select a label\n2. Add a new label\n"
    print "Choose by number\n"
    select_label = gets.chomp
    case select_label
    when '1'
      if @labels.length.positive?
        list_labels(@labels)
        print 'Select an option from the above: '
        option = gets.chomp
        label = @labels[option.to_i]
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
      @labels << label
    else
      print "Invalid option, please try again\n"
      return
    end

    print 'Source: '
    source = Source.new(gets.chomp)
    @sources << source

    {
      genre: genre,
      author: author,
      source: source,
      label: label,
      publisher: publisher,
      cover_state: cover_state,
      published_date: published_date
    }
  end

  def label_inputs
    print 'Title: '
    title = gets.chomp.to_s
    print 'Color: '
    color = gets.chomp.to_s
    [title, color]
  end
end
