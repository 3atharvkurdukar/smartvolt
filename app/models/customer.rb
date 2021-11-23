class Customer < ApplicationRecord
  has_many :connections, dependent: :destroy

  has_secure_password

  validates :name, presence: true
  validates :mobileno, presence: true, numericality: true, length: { minimum: 10, maximum: 10 }
  validates :username, presence: true, uniqueness: true
end
