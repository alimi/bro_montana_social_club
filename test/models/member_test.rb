require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  test "#valid? when name is blank" do
    member = Member.new

    member.valid?

    assert member.errors[:name].present?,
      "It adds an error on name"
  end

  test "#valid? when email is blank" do
    member = Member.new

    member.valid?

    assert member.errors[:email].present?,
      "It adds an error on email"
  end

  test "#valid? when there is another member with the same email" do
    another_member = Member.create!(name: "foo", email: "foo@bar.com")
    member = Member.new(email: "foo@bar.com")

    member.valid?

    assert member.errors[:email].present?,
      "It adds an error on email"
  end
end
