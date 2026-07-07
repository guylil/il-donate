class Campaign < ApplicationRecord
  has_one_attached :cover_image
  has_many :donations, dependent: :destroy

  validates :title, :organization_name, :goal_amount, presence: true
  validates :slug, uniqueness: true, presence: true
  validates :goal_amount, numericality: { greater_than: 0 }
  validates :amount_raised, numericality: { greater_than_or_equal_to: 0 }

  before_validation :generate_slug, on: :create

  def progress_percentage
    return 0 if goal_amount.zero?
    [(amount_raised.to_f / goal_amount * 100).round(1), 100.0].min
  end

  def amount_needed
    [goal_amount - amount_raised, 0].max
  end

  private

  def generate_slug
    return if slug.present?
    base = title.parameterize.presence || "campaign"
    candidate = base
    counter = 1
    while self.class.exists?(slug: candidate)
      candidate = "#{base}-#{counter}"
      counter += 1
    end
    self.slug = candidate
  end
end
