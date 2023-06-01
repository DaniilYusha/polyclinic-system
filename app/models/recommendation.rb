class Recommendation < ApplicationRecord
  belongs_to :appointment

  after_create -> { appointment.closed! }

  validates :content, presence: true
end
