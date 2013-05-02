# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Invitation < ActiveRecord::Base

  attr_accessible :user_id
  belongs_to :user
  belongs_to :event

  validates :user, :presence => true

end
