# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  description :text
#  complete    :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class Task < ActiveRecord::Base
  attr_accessible :complete, :description
end
