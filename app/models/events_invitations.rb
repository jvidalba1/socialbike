# == Schema Information
#
# Table name: events_invitations
#
#  event_id      :integer
#  invitation_id :integer
#

class Events_Invitations < ActiveRecord::Base
  attr_accessible :event_id, :invitation_id


  validates :event_id, :invitation_id, :presence => true

end
