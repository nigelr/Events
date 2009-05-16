require 'test_helper'

class MembershipTest < ActiveSupport::TestCase
  should "be valid" do
    assert Membership.new.valid?
  end
end
