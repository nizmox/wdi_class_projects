# == Schema Information
#
# Table name: recipes
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  course       :string(255)
#  cooktime     :integer
#  servingsize  :integer
#  instructions :text
#  image        :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Recipe < ActiveRecord::Base
  attr_accessible :name, :course, :cooktime, :servingsize, :instructions, :image, :book_id, :ingredient_ids
  #relationships
  has_and_belongs_to_many :book
  has_and_belongs_to_many :ingredients
end
