class Print < ApplicationRecord
  belongs_to :project
  belongs_to :user
  DEVICE = ['Xerox', 'KIPP', 'HP', 'Epson', 'Other'].freeze
  FORMAT = ['Letter', 'Legal', 'Ledger', 'Large Format'].freeze
  MEDIA = ['Black + White', 'Color', 'Scan']
end


# Xerox
# Color
#   Letter $0.75
#   Legal $1.20
# B+W
#   Letter $0.10
#   Legal $0.20

# KIPP
#   Ledger $1.50
#   Large Format $5.70

# EPSON
#  Letter $0.08
#  Legal $0.16
