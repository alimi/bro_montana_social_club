class Invitation < ActiveRecord::Base
  belongs_to :user

  before_create :generate_token

  def accepted?
    expired? && user.valid?
  end

  def expired?
    expired_at.present?
  end

  private

  def generate_token
    self.token = SecureRandom.hex
  end
end
