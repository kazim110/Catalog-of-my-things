# frozen_string_literal: true

require 'date'

# This is the Item class, which represents an item with attributes like author, label, genre, and published date.
class Item
  attr_accessor(
    :genre,
    :author,
    :source,
    :label,
    :publish_date
  )

  def initialize(genre, author, source, label, publish_date)
    @id = Math.rand(1..100)
    @archived = false
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
  end

  def can_be_archived?
    Date.new.year - @publish_date.year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_genre
    @genre.add_item(self)
  end

  def add_author
    @author.add_item(self)
  end

  def add_label
    @label.add_item(self)
  end

  def add_source
    @source.add_item(self)
  end

  private :can_be_archived?
end
