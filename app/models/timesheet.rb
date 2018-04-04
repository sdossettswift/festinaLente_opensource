class Timesheet < ApplicationRecord
  belongs_to :user
  has_many :events

  STATUS = [
          'Unsubmitted',
          'Submitted',
          'Rejected'].freeze

end

# Timesheet
# User will create bi-weekly timesheets. Upon submittal, they will be locked.
# A PDF will be generated and stored to preserve a snapshot.
