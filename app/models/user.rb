class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :userable, polymorphic: true, dependent: :destroy, required: false

  validates :username,
            presence: true,
            uniqueness: true,
            length: { minimum: 3, maximum: 20 }

  def to_s
    "#{username} (#{email})"
  end

  def recruiter?
    userable_type == 'Recruiter'
  end

  def contestant?
    userable_type == 'Contestant'
  end
end
