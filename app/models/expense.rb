class Expense < ApplicationRecord
		CATEGORY = [
					'Courier | Postage',
					'Mileage',
					'Tolls',
					'Plotting | Printing',
					'Travel',
					'Supplies',
					'Samples',
					'Other'].freeze

		belongs_to :project
		belongs_to :user

		scope :not_nil, -> {where.not(amount: nil)}

end
