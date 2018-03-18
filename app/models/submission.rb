class Submission < ApplicationRecord
  belongs_to :contestant
  belongs_to :contest

  validates :source, presence: true

  default_scope { order(id: :desc) }

  def to_s
    "#{self.class} by #{contestant} for #{contest}"
  end
end
