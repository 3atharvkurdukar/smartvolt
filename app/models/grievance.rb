class Grievance < ApplicationRecord
  belongs_to :connection
  belongs_to :official
end
