# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  corporation_id :integer
#  name           :string
#  age            :integer
#  sex_id         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class User < ApplicationRecord
  belongs_to :corporation
end
