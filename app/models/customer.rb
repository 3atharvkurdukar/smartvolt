class Customer < ApplicationRecord
  has_many :connections, dependent: :destroy
end
