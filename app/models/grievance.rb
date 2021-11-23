class Grievance < ApplicationRecord
  belongs_to :connection
  belongs_to :official

  validates :problem, presence: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: ["Pending", "Work in Progress", "Resolved"], message: "is invalid" }
end
