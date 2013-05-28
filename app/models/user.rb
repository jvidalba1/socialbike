# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  email              :string(255)
#  provider           :string(255)
#  uid                :string(255)
#  oauth_token        :string(255)
#  oauth_expires_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encrypted_password :string(255)
#  salt               :string(255)
#

class User < ActiveRecord::Base

  attr_accessor :password
  attr_accessible :email, :name, :password, :password_confirmation

  has_many :events, :dependent => :destroy
  has_many :invitations

  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy

  has_many :followed_users, :through => :relationships, :source => :followed

  has_many :reverse_relationships,  :foreign_key => "followed_id",
                                    :class_name  =>  "Relationship",
                                    :dependent   =>   :destroy

  has_many :followers, :through => :reverse_relationships, :source => :follower
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,		:presence 		  => true,
                      :length   		  => { :maximum => 50}

  validates :email,
            #:presence 		  => true,
                    #  :format 			  => { :with => EMAIL_REGEX},
                      :uniqueness 	  => { :case_sensitive => false, :message => " -Este email ya existe" }

  validates :password,
  # :presence 		  => { :message => "Ingresa una contrasenia"},
                       :confirmation 	=> { :message => " -Confirmacion mala"}
  #                     :length			  => { :within => 6..40, :message => "Min 6 y Max 40" }

  before_save :encrypt_password
=begin
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
=end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(:followed_id => other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def self.search_user(search, page)

    paginate :per_page => 5, :page => page,
             :conditions => ['name like ?',"%#{search}%"],
             :order => 'name'
  end

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  class << self

    def authenticate(email, submitted_password)
      user = find_by_email(email)
      (user && user.has_password?(submitted_password)) ? user : nil
    end

    def authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      (user && user.salt == cookie_salt) ? user : nil
    end
  end

  private

  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
