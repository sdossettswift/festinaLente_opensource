class User < ApplicationRecord
	has_many :events
	has_many :expenses
	has_many :prints
	has_many :projects, through: :events
	has_many :clients, through: :projects
	has_many :timesheets

	has_secure_password

	ROLE = [
					'Admin',
					'Architect',
                                        'Apprentice',
					'Office Manager'].freeze

	scope :by_role, -> (role_name) { where(role: role_name) }

	validates :username, presence: true, uniqueness: true
	scope :sorted, -> { order(last_name: "ASC") }


end
