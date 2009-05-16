require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  should "be valid" do
    assert Member.new.valid?
  end
end
