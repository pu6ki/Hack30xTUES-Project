class Contest < ApplicationRecord
  belongs_to :recruiter
  belongs_to :technology

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5 }

  has_many :test_cases
  has_many :submissions

  def to_s
    "\"#{title}\" by #{recruiter}"
  end
end
