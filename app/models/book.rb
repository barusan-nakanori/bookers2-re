class Book < ApplicationRecord
	validates :title,presence: true
	validates :text, presence: true, length: {maxmum: 200}
	belongs_to :user
end
