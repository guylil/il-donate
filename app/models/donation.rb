class Donation < ApplicationRecord
  belongs_to :campaign

  enum :display_preference, { full_name: 0, first_name_only: 1, anonymous: 2 }

  validates :amount, numericality: { greater_than: 0 }
  validates :display_preference, presence: true
  validates :status, inclusion: { in: %w[pending completed failed] }
end
