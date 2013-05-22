# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  event_id   :integer
#  blog_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base

  attr_accessible :content, :event_id, :blog_id

  belongs_to :event
  belongs_to :blog

  #validates :content, :presence => true
end
