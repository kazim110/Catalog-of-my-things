require_relative 'label'
require_relative 'book'
require 'json'


def loadlabel
  labels = []
  return labels if File.empty?('json/label.json')

  labelsdata = File.read('json/label.json')
  labelsarray = JSON.parse(labelsdata)
  labelsarray.each do |label|
    labels << Label.new(label['title'], label['color'])
  end
  labels
end

def loadbook
  books = []
  return books if File.empty?('json/book.json')

  booksdata = File.read('json/book.json')
  booksarray = JSON.parse(booksdata)
  booksarray.each do |book|
    newbook = Book.new(book['publisher'], book['cover_state'], book['published_date'])
    genre = Genre.new(book['genre'])
    newbook.genre = genre
    books << newbook
  end
  books
end
