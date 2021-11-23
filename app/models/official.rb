class Official < ApplicationRecord
  has_many :bills, dependent: :destroy
  has_many :grievances, dependent: :destroy
end
