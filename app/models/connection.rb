class Connection < ApplicationRecord
  has_many :bills, dependent: :destroy
  has_many :grievances, dependent: :destroy
  belongs_to :customer
end
