class GroupManager < ActiveRecord::Base
  belongs_to :group
  belongs_to :member
end
