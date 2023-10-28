require_relative 'app'

def display_options
  puts "\nPlease choose an option by entering a number:"
  puts '1 - list all books'
  puts '2 - list all music albums'
  puts '3 - list all games'
  puts '4 - list all genres'
  puts '5 - list all labels'
  puts '6 - list all authors'
  puts '7 - list all sources'
  puts '8 - Add a book'
  puts '9 - Add a music album'
  puts '10 - Add a game'
  puts '11 - Exit'
end

def main
  app = App.new
  puts 'Welcome to Catalog of my things'
  loop do
    display_options
    option = gets.chomp.to_i
    app.run(option)
  end
  puts 'Thank you for using the app. Goodbye!'
end

main
