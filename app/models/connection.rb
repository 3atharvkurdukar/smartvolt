class Connection < ApplicationRecord
  has_many :bills, dependent: :destroy
  has_many :grievances, dependent: :destroy
  belongs_to :customer

  validates :name, presence: true
  validates :address, presence: true
  validates :connection_type, presence: true, inclusion: { in: ["Domestic", "Commercial", "Industrial"], message: "is invalid" }
  validates :phase, presence: true, inclusion: { in: [1, 3], message: "is invalid" }
  validates :rate, presence: true, inclusion: { in: [5, 10, 15], message: "is invalid" }
  validates :area, presence: true, inclusion: { in: ["Sector 1", "Sector 2", "Sector 3", "Sector 4", "Sector 5"], message: "is invalid" }
end
