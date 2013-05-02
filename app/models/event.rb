# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  date        :date(255)
#  estado      :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
  attr_accessible :date, :description, :estado, :name

  belongs_to :user
  has_many :invitations
  has_many :users, :through => :invitations

  default_scope :order => 'events.created_at DESC'

  validates :user_id,         :presence => true

  validates :date,            :presence => true,
                              :length   => { :maximum => 10 }

  validates :description,     :presence => true,
                              :length   => { :maximum => 140 }

  validates :estado,          :presence => true

  validates :name,            :presence => true,
                              :length   => { :maximum => 15 }
end
