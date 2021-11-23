class Bill < ApplicationRecord
  belongs_to :connection
  belongs_to :official

  validates :prev_reading, presence: true
  validates :image_url, presence: true
  validates :status, presence: true, inclusion: { in: ["Image Uploaded", "Bill Generated"], message: "is invalid" }
end
