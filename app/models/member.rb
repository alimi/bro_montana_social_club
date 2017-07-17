class Member < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
