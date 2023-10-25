def display_options
  puts "\nPlease choose an option by entering a number:"
  puts '1  - list all books'
  puts '2  - list all music albums'
  puts '3  - list all games'
  puts '4  - list all genres'
  puts '5  - list all labels'
  puts '6  - list all authors'
  puts '7  - Add a book'
  puts '8  - Add a music album'
  puts '9  - Add a game'
  puts '10 - Exit'
end

def main
  puts 'Welcome to Catalog of my things'

  loop do
    display_options
    print 'Your choice: '
    option = gets.chomp.to_i
  end
end
  
main
