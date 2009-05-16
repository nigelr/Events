require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  context "new action" do
    should "render new template" do
      get :new
      assert_template 'new'
    end
  end
  
  context "create action" do
    should "render new template when model is invalid" do
      Person.any_instance.stubs(:valid?).returns(false)
      post :create
      assert_template 'new'
    end
  
    should "redirect when model is valid" do
      Person.any_instance.stubs(:valid?).returns(true)
      post :create
      assert_redirected_to root_url
      assert_equal assigns['person'].id, session['person_id']
    end
  end
end
