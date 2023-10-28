module InputTaker
  def book_inputs
    print 'publisher: '
    publisher = gets.chomp.to_s
    print 'cover_state: '
    cover_state = gets.chomp.to_s.downcase
    print 'published_date(YYYY-MM-DD): '
    published_date = gets.chomp.to_s
    print 'genre: '
    genre = gets.chomp.to_s.capitalize
    [publisher, cover_state, published_date, genre]
  end

  def label_inputs
    print 'Title: '
    title = gets.chomp.to_s
    print 'Color: '
    color = gets.chomp.to_s
    [title, color]
  end
end
