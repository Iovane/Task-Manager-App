class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {minimum: 5, maximum: 100}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}

  VALID_DATE_REGEX = /\A\d{4}-\d{2}-\d{2}\z/i
  validates :deadline, presence: true, format: {with: VALID_DATE_REGEX}
  validate :deadline_cannot_be_in_the_past

  VALID_STATUSES = ["NOT STARTED", "IN PROGRESS", "COMPLETED"]
  validates :status, presence: true, inclusion: {in: VALID_STATUSES}


  private
  def deadline_cannot_be_in_the_past
    if deadline.present? && deadline < Date.today
      errors.add(:deadline, "can't be in the past")
    end
  end
end
