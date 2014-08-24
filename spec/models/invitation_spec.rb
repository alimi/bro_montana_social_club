require 'rails_helper'

describe Invitation do
  let(:invitation) { Invitation.create! email: 'invited@user.com' }

  context 'before_create' do
    subject { invitation.token }

    it 'gets a token' do
      expect(subject).not_to be_nil
    end
  end
end
