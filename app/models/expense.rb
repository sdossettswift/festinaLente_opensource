class Expense < ApplicationRecord
		CATEGORY = [
					'Courier',
					'Mileage',
					'Tolls',
					'Other'].freeze

		belongs_to :project
		belongs_to :user

		scope :not_nil, -> {where.not(amount: nil)}

end
