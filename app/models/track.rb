# == Schema Information
#
# Table name: tracks
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  gpx_file_name    :string(255)
#  gpx_content_type :string(255)
#  gpx_file_size    :integer
#  gpx_updated_at   :datetime
#

class Track < ActiveRecord::Base
  attr_accessible :name, :gpx

  has_attached_file :gpx

  has_many :tracksegments, :dependent => :destroy
  has_many :points, :through => :tracksegments

end
