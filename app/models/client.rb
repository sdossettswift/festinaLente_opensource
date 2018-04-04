class Client < ApplicationRecord
	 has_many :projects
	 has_many :events, through: :projects
	 has_many :expenses, through: :projects
	 has_many :prints, through: :projects
	 validates :name, presence: true
	 scope :sorted, -> { order(name: "ASC") }

end
