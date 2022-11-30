class Profile < ApplicationRecord
  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9-]*\z/ }
  has_many :repositories, dependent: :destroy
  accepts_nested_attributes_for :repositories

end
