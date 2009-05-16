require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  def new_person(attributes = {})
    attributes[:username] ||= 'foo'
    attributes[:email] ||= 'foo@example.com'
    attributes[:password] ||= 'abc123'
    attributes[:password_confirmation] ||= attributes[:password]
    person = Person.new(attributes)
    person.valid? # run validations
    person
  end
  
  def setup
    Person.delete_all
  end
  
  should "be valid" do
    assert new_person.valid?
  end
  
  should "require username" do
    assert new_person(:username => '').errors.on(:username)
  end
  
  should "require password" do
    assert new_person(:password => '').errors.on(:password)
  end
  
  should "require well formed email" do
    assert new_person(:email => 'foo@bar@example.com').errors.on(:email)
  end
  
  should "validate uniqueness of email" do
    new_person(:email => 'bar@example.com').save!
    assert new_person(:email => 'bar@example.com').errors.on(:email)
  end
  
  should "validate uniqueness of username" do
    new_person(:username => 'uniquename').save!
    assert new_person(:username => 'uniquename').errors.on(:username)
  end
  
  should "not allow odd characters in username" do
    assert new_person(:username => 'odd ^&(@)').errors.on(:username)
  end
  
  should "validate password is longer than 3 characters" do
    assert new_person(:password => 'bad').errors.on(:password)
  end
  
  should "require matching password confirmation" do
    assert new_person(:password_confirmation => 'nonmatching').errors.on(:password)
  end
  
  should "generate password hash and salt on create" do
    person = new_person
    person.save!
    assert person.password_hash
    assert person.password_salt
  end
  
  should "authenticate by username" do
    person = new_person(:username => 'foobar', :password => 'secret')
    person.save!
    assert_equal person, Person.authenticate('foobar', 'secret')
  end
  
  should "authenticate by email" do
    person = new_person(:email => 'foo@bar.com', :password => 'secret')
    person.save!
    assert_equal person, Person.authenticate('foo@bar.com', 'secret')
  end
  
  should "not authenticate bad username" do
    assert_nil Person.authenticate('nonexisting', 'secret')
  end
  
  should "not authenticate bad password" do
    new_person(:username => 'foobar', :password => 'secret').save!
    assert_nil Person.authenticate('foobar', 'badpassword')
  end
end
