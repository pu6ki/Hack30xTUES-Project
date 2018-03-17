class Contestant < ApplicationRecord
  has_one :user, as: :userable, required: true, dependent: :destroy
  accepts_nested_attributes_for :user

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_and_belongs_to_many :schools

  has_many :submissions

  def full_name
    first_name + ' ' + last_name
  end

  def to_s
    "#{user} [#{full_name}]"
  end

  def contests_participated
    Contest.select { |c| c.submissions.any? { |s| self == s.contestant } }
  end
end
