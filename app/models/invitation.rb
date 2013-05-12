# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#

class Invitation < ActiveRecord::Base

  attr_accessible :user_id, :event_id

  belongs_to :user
  belongs_to :event

  validates :user, :presence => true
  validates :event, :presence => true

  default_scope :order => 'invitations.created_at DESC'
end
