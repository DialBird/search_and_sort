# == Schema Information
#
# Table name: dogs
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dog < ApplicationRecord
  belongs_to :user
end
