require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  should "be valid" do
    assert Group.new.valid?
  end
end
