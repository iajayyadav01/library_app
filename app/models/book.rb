class Book < ApplicationRecord
	validates_presence_of :book_title
	has_many :author_books
	has_many :authors, :through => :author_books
	accepts_nested_attributes_for :authors
end
