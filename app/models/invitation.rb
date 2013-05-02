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
  has_and_belongs_to_many :events

  validates :user_id, :presence => true

  default_scope :order => 'invitations.created_at DESC'
end
