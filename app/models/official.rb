class Official < ApplicationRecord
  has_many :bills, dependent: :destroy
  has_many :grievances, dependent: :destroy

  has_secure_password

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :area, presence: true, inclusion: { in: ["Sector 1", "Sector 2", "Sector 3", "Sector 4", "Sector 5"], message: "is invalid" }
end
