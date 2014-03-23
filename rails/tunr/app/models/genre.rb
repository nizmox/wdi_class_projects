# == Schema Information
#
# Table name: genres
#
#  id    :integer          not null, primary key
#  name  :string(255)
#  image :text
#

class Genre < ActiveRecord::Base
  attr_accessible :name, :image
  has_and_belongs_to_many :songs
end
