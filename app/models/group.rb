class Group < ActiveRecord::Base
  has_many :memberships
  has_many :members, :through => :memberships
  belongs_to :member
  has_many :group_managers
  has_many :managers, :through => :group_managers

end
