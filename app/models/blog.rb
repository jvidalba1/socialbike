# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Blog < ActiveRecord::Base
  attr_accessible :name, :content

  belongs_to :user

  validates :name,  :presence => true

  validates :content, :presence => true
end
