class Book < ApplicationRecord
	validates :title,presence: true
	validates :text, presence: true, length: {maximum: 200}
	belongs_to :user
end
