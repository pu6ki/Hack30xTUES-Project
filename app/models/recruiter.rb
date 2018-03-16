class Recruiter < ApplicationRecord
  has_one :user, as: :userable, required: true, dependent: :destroy
  accepts_nested_attributes_for :user

  has_and_belongs_to_many :technologies
  validates :technologies, presence: true

  validates :company_name, uniqueness: true, presence: true

  URL_VALIDATION_REGEX = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
  validates_format_of :website, with: URL_VALIDATION_REGEX, multiline: true

  def to_s
    "#{user} [#{company_name}]"
  end
end
