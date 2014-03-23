# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  image           :text
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :image, :password, :password_confirmation
  has_many :mixtapes

  has_secure_password
  validates :image, :presence => true
  validates :name, :presence => true, :length => { :minimum => 2 }
end
