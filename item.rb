# This is the Item class, which represents an item with attributes like author, label, genre, and published date.

require 'date'

class Item
  attr_accessor(
    :genre,
    :author,
    :source,
    :label,
    :publish_date,
    :archived
  )

  attr_reader :id

  # rubocop:disable Metrics/ParameterLists
  def initialize(genre, author, source, label, publish_date, id = rand(1..10_000))
    @id = id
    @archived = false
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date

    # Add this item to the corresponding arrays in the classes
    add_item(@genre)
    add_item(@author)
    # add_item(@source)
    add_item(@label)
    # rubocop:enable Metrics/ParameterLists
  end

  def can_be_archived?
    Date.today.year - @publish_date.year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_item(obj)
    obj.add_item(self)
  end

  private :can_be_archived?
end
