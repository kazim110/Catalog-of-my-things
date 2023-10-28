require 'json'

def store_label(class_label)
  labels = []
  class_label.each do |label|
    labels << { title: label.title, color: label.color }
  end
  label_json = JSON.generate(labels)
  File.write('json/label.json', label_json)
end

def store_books(class_book)
  books = []
  class_book.each do |book|
    books << { publisher: book.publisher,
               cover_state: book.cover_state,
               published_date: book.published_date,
               genre: book.genre.name }
  end
  book_json = JSON.generate(books)
  File.write('json/book.json', book_json)
end
