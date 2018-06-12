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

  def submissions_by_contest(contest)
    contest.submissions.select { |submission| self == submission.contestant }
  end

  def contests_participated
    Contest.select do |contest|
      submissions_by_contest(contest)
    end
  end

  def solving_submissions(contest)
    submissions_by_contest(contest).select(&:solving?)
  end
end
