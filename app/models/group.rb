class Group < ActiveRecord::Base
  has_many :memberships
  has_many :people, :through => :memberships
  belongs_to :person

end
