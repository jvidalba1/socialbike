# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  event_id   :integer
#  blog_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base

  attr_accessible :content, :event_id, :blog_id, :user_id

  belongs_to :event
  belongs_to :blog
  belongs_to :user

  #validates :content, :presence => true

  default_scope :order => 'comments.created_at DESC'
end
