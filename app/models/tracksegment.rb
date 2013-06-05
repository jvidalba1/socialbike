# == Schema Information
#
# Table name: tracksegments
#
#  id         :integer          not null, primary key
#  Track_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tracksegment < ActiveRecord::Base
  belongs_to :Track
  # attr_accessible :title, :body

  has_many :points, :dependent => :destroy

end
