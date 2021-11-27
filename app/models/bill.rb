class Bill < ApplicationRecord
  belongs_to :connection
  belongs_to :official
  has_one_attached :image, dependent: :destroy

  validates :prev_reading, presence: true
  validates :image, attached: true, content_type: ["image/png", "image/jpg", "image/jpeg"]
  validates :status, presence: true, inclusion: { in: ["Image Uploaded", "Bill Generated"], message: "is invalid" }
end
