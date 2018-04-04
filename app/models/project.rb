class Project < ApplicationRecord
	 belongs_to :client
	 has_many :events
	 has_many :users, through: :events
	 has_many :expenses
	 has_many :prints
	 validates :client, presence: true
	 validates :number, presence: true

	 scope :sorted, -> { order(number: "ASC") }

end
