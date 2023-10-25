# frozen_string_literal: true

require 'date'

# This is the Item class, which represents an item with attributes like author, label, genre, and published date.
class Item
  attr_accessor :author, :label, :genre, :published_date
  attr_reader :archived

  def initialize(published_date, archived: false)
    @id = rand(1...100)
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @published_date = Date.parse(published_date)
    @archived = archived
  end

  def can_be_archived?
    (Date.today.year - @published_date.year).to_i > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
