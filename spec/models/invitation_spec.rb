require 'rails_helper'

describe Invitation do
  let(:user) do
    user = User.new email: 'invited@user.com'
    user.save(validate: false)
    user
  end

  let(:invitation) { user.create_invitation! }

  context 'before_create' do
    subject { invitation.token }

    it 'gets a token' do
      expect(subject).not_to be_nil
    end
  end
end
