require_relative '../book'
require_relative '../label'
require_relative '../author'
require_relative '../genre'

module Methods
  # create a book
  def add_book
    data = book_inputs
    book = Book.new(data[:genre], data[:author], data[:source], data[:label], data[:publish_date], data[:publisher],
                    data[:cover_state])
    @books << book
    puts "\nThanks!"
    puts 'This book created:'
    puts "Publisher: #{data[0]}, Cover_state: #{data[1]}, Published_Date: #{data[2]}"
  end

  def list_books
    puts 'List of the books:'
    @books.each_with_index do |book, i|
      puts "#{i}:) Publisher: #{book.publisher}, Cover_state: #{book.cover_state}, Genre: #{book.genre.name}"
    end
  end

  # def list_labels
  #   puts 'List of the labels:'
  #   @labels.each_with_index do |label, i|
  #     puts "#{i}:) Title: #{label.title}, Color: #{label.color}"
  #   end
  # end
end
