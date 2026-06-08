class Expense < ApplicationRecord
  belongs_to :category

  validates :description, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :expense_date, presence: true

  # The "Future Expense" Guard
  validate :date_cannot_be_in_the_future

  private

  def date_cannot_be_in_the_future
    if expense_date.present? && expense_date > Date.today
      errors.add(:expense_date, "It can't be in the future")
    end
  end
end
