class Group < ActiveRecord::Base
  has_many :memberships
  has_many :members, :through => :memberships
  belongs_to :member

end
