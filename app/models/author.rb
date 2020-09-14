class Author < ApplicationRecord
	validates_presence_of :first_name
	validates_presence_of :last_name
	validates_presence_of :date_of_birth
	has_many :author_books
	has_many :books, :through => :author_books
	accepts_nested_attributes_for :books

	def complete_name
		"#{first_name} #{last_name}"
	end
end
